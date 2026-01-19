import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tripsync/core/config/app_secrets.dart';

class FlightInfo {
  final String flightNumber;
  final String airline;
  final String airlineName;
  final String departureAirport;
  final String arrivalAirport;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String? departureTerminal;
  final String? arrivalTerminal;
  final String? departureGate;
  final String? arrivalGate;
  final String? status;
  final String? aircraftType;

  FlightInfo({
    required this.flightNumber,
    required this.airline,
    required this.airlineName,
    required this.departureAirport,
    required this.arrivalAirport,
    this.departureTime,
    this.arrivalTime,
    this.departureTerminal,
    this.arrivalTerminal,
    this.departureGate,
    this.arrivalGate,
    this.status,
    this.aircraftType,
  });

  factory FlightInfo.fromAeroDataBox(Map<String, dynamic> json) {
    final departure = json['departure'] as Map<String, dynamic>?;
    final arrival = json['arrival'] as Map<String, dynamic>?;

    return FlightInfo(
      flightNumber: json['number'] ?? '',
      airline: json['airline']?['iata'] ?? '',
      airlineName: json['airline']?['name'] ?? '',
      departureAirport: departure?['airport']?['iata'] ?? '',
      arrivalAirport: arrival?['airport']?['iata'] ?? '',
      departureTime: departure?['scheduledTime']?['utc'] != null
          ? DateTime.tryParse(departure!['scheduledTime']['utc'])
          : null,
      arrivalTime: arrival?['scheduledTime']?['utc'] != null
          ? DateTime.tryParse(arrival!['scheduledTime']['utc'])
          : null,
      departureTerminal: departure?['terminal'],
      arrivalTerminal: arrival?['terminal'],
      departureGate: departure?['gate'],
      arrivalGate: arrival?['gate'],
      status: json['status'],
      aircraftType: json['aircraft']?['model'],
    );
  }
}

class FlightSearchService {
  // RapidAPI AeroDataBox - keys from AppSecrets
  static String get _rapidApiKey => AppSecrets.rapidApiKey;
  static String get _rapidApiHost => AppSecrets.rapidApiHost;
  static const String _baseUrl = 'https://aerodatabox.p.rapidapi.com';

  final http.Client _client;

  FlightSearchService({http.Client? client}) : _client = client ?? http.Client();

  /// 항공편 번호와 날짜로 항공편 정보를 검색합니다.
  /// [flightNumber] - 항공편 번호 (예: KE123, OZ345)
  /// [date] - 비행 날짜
  Future<FlightInfo?> searchFlight(String flightNumber, DateTime date) async {
    if (_rapidApiKey == 'YOUR_RAPIDAPI_KEY') {
      throw Exception('RapidAPI 키가 설정되지 않았습니다. flight_search_service.dart에서 _rapidApiKey를 설정하세요.');
    }

    try {
      // 항공편 번호 정규화 (공백 제거, 대문자)
      final normalizedFlightNumber = flightNumber.replaceAll(' ', '').toUpperCase();

      // 날짜 포맷 (YYYY-MM-DD)
      final dateStr = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      final url = Uri.parse('$_baseUrl/flights/number/$normalizedFlightNumber/$dateStr');

      final response = await _client.get(
        url,
        headers: {
          'X-RapidAPI-Key': _rapidApiKey,
          'X-RapidAPI-Host': _rapidApiHost,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return FlightInfo.fromAeroDataBox(data.first);
        }
      } else if (response.statusCode == 404) {
        return null; // 항공편을 찾을 수 없음
      } else {
        print('Flight search error: ${response.statusCode} - ${response.body}');
      }

      return null;
    } catch (e) {
      print('Flight search exception: $e');
      return null;
    }
  }

  /// 공항의 출발 항공편을 검색합니다.
  /// [airportCode] - IATA 공항 코드 (예: ICN, GMP)
  /// [fromTime] - 검색 시작 시간
  /// [toTime] - 검색 종료 시간
  Future<List<FlightInfo>> getDepartures(
    String airportCode,
    DateTime fromTime,
    DateTime toTime,
  ) async {
    if (_rapidApiKey == 'YOUR_RAPIDAPI_KEY') {
      throw Exception('RapidAPI 키가 설정되지 않았습니다.');
    }

    try {
      final fromStr = fromTime.toUtc().toIso8601String().split('.').first;
      final toStr = toTime.toUtc().toIso8601String().split('.').first;

      final url = Uri.parse(
        '$_baseUrl/flights/airports/iata/$airportCode/$fromStr/$toStr'
        '?withLeg=true&direction=Departure&withCancelled=false',
      );

      final response = await _client.get(
        url,
        headers: {
          'X-RapidAPI-Key': _rapidApiKey,
          'X-RapidAPI-Host': _rapidApiHost,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final departures = data['departures'] as List<dynamic>? ?? [];
        return departures.map((d) => FlightInfo.fromAeroDataBox(d)).toList();
      }

      return [];
    } catch (e) {
      print('Departures search exception: $e');
      return [];
    }
  }

  /// 공항의 도착 항공편을 검색합니다.
  Future<List<FlightInfo>> getArrivals(
    String airportCode,
    DateTime fromTime,
    DateTime toTime,
  ) async {
    if (_rapidApiKey == 'YOUR_RAPIDAPI_KEY') {
      throw Exception('RapidAPI 키가 설정되지 않았습니다.');
    }

    try {
      final fromStr = fromTime.toUtc().toIso8601String().split('.').first;
      final toStr = toTime.toUtc().toIso8601String().split('.').first;

      final url = Uri.parse(
        '$_baseUrl/flights/airports/iata/$airportCode/$fromStr/$toStr'
        '?withLeg=true&direction=Arrival&withCancelled=false',
      );

      final response = await _client.get(
        url,
        headers: {
          'X-RapidAPI-Key': _rapidApiKey,
          'X-RapidAPI-Host': _rapidApiHost,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final arrivals = data['arrivals'] as List<dynamic>? ?? [];
        return arrivals.map((d) => FlightInfo.fromAeroDataBox(d)).toList();
      }

      return [];
    } catch (e) {
      print('Arrivals search exception: $e');
      return [];
    }
  }

  void dispose() {
    _client.close();
  }
}
