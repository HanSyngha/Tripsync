class Airport {
  final String iataCode;
  final String icaoCode;
  final String name;
  final String nameKo;
  final String city;
  final String cityKo;
  final String country;
  final String countryKo;
  final List<String> terminals;
  final double latitude;
  final double longitude;
  final String timezone;

  const Airport({
    required this.iataCode,
    required this.icaoCode,
    required this.name,
    required this.nameKo,
    required this.city,
    required this.cityKo,
    required this.country,
    required this.countryKo,
    this.terminals = const [],
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });

  String get displayName => '$city ($iataCode)';
  String get displayNameKo => '$cityKo ($iataCode)';
  String get fullName => '$name ($iataCode)';
  String get fullNameKo => '$nameKo ($iataCode)';

  bool matchesQuery(String query) {
    final q = query.toLowerCase();
    return iataCode.toLowerCase().contains(q) ||
        icaoCode.toLowerCase().contains(q) ||
        name.toLowerCase().contains(q) ||
        nameKo.contains(q) ||
        city.toLowerCase().contains(q) ||
        cityKo.contains(q) ||
        country.toLowerCase().contains(q) ||
        countryKo.contains(q);
  }
}

class AirportDatabase {
  static const List<Airport> airports = [
    // South Korea
    Airport(
      iataCode: 'ICN', icaoCode: 'RKSI',
      name: 'Incheon International Airport', nameKo: '인천국제공항',
      city: 'Seoul', cityKo: '서울/인천',
      country: 'South Korea', countryKo: '대한민국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 37.4602, longitude: 126.4407, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'GMP', icaoCode: 'RKSS',
      name: 'Gimpo International Airport', nameKo: '김포국제공항',
      city: 'Seoul', cityKo: '서울',
      country: 'South Korea', countryKo: '대한민국',
      terminals: ['Domestic', 'International'],
      latitude: 37.5583, longitude: 126.7906, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'PUS', icaoCode: 'RKPK',
      name: 'Gimhae International Airport', nameKo: '김해국제공항',
      city: 'Busan', cityKo: '부산',
      country: 'South Korea', countryKo: '대한민국',
      terminals: ['Domestic', 'International'],
      latitude: 35.1795, longitude: 128.9382, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'CJU', icaoCode: 'RKPC',
      name: 'Jeju International Airport', nameKo: '제주국제공항',
      city: 'Jeju', cityKo: '제주',
      country: 'South Korea', countryKo: '대한민국',
      terminals: ['Domestic', 'International'],
      latitude: 33.5066, longitude: 126.4929, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'TAE', icaoCode: 'RKTN',
      name: 'Daegu International Airport', nameKo: '대구국제공항',
      city: 'Daegu', cityKo: '대구',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 35.8941, longitude: 128.6589, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'CJJ', icaoCode: 'RKTU',
      name: 'Cheongju International Airport', nameKo: '청주국제공항',
      city: 'Cheongju', cityKo: '청주',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 36.7166, longitude: 127.4991, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'KWJ', icaoCode: 'RKJJ',
      name: 'Gwangju Airport', nameKo: '광주공항',
      city: 'Gwangju', cityKo: '광주',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 35.1264, longitude: 126.8089, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'RSU', icaoCode: 'RKJY',
      name: 'Yeosu Airport', nameKo: '여수공항',
      city: 'Yeosu', cityKo: '여수',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 34.8423, longitude: 127.6169, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'USN', icaoCode: 'RKPU',
      name: 'Ulsan Airport', nameKo: '울산공항',
      city: 'Ulsan', cityKo: '울산',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 35.5935, longitude: 129.3519, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'MWX', icaoCode: 'RKJM',
      name: 'Muan International Airport', nameKo: '무안국제공항',
      city: 'Muan', cityKo: '무안',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 34.9914, longitude: 126.3828, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'KPO', icaoCode: 'RKTH',
      name: 'Pohang Airport', nameKo: '포항공항',
      city: 'Pohang', cityKo: '포항',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 35.9879, longitude: 129.4204, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'WJU', icaoCode: 'RKNW',
      name: 'Wonju Airport', nameKo: '원주공항',
      city: 'Wonju', cityKo: '원주',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 37.4383, longitude: 127.9604, timezone: 'Asia/Seoul',
    ),
    Airport(
      iataCode: 'YNY', icaoCode: 'RKNY',
      name: 'Yangyang International Airport', nameKo: '양양국제공항',
      city: 'Yangyang', cityKo: '양양',
      country: 'South Korea', countryKo: '대한민국',
      latitude: 38.0612, longitude: 128.6689, timezone: 'Asia/Seoul',
    ),

    // Japan
    Airport(
      iataCode: 'NRT', icaoCode: 'RJAA',
      name: 'Narita International Airport', nameKo: '나리타 국제공항',
      city: 'Tokyo', cityKo: '도쿄',
      country: 'Japan', countryKo: '일본',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 35.7647, longitude: 140.3864, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'HND', icaoCode: 'RJTT',
      name: 'Haneda Airport', nameKo: '하네다 공항',
      city: 'Tokyo', cityKo: '도쿄',
      country: 'Japan', countryKo: '일본',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 35.5494, longitude: 139.7798, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'KIX', icaoCode: 'RJBB',
      name: 'Kansai International Airport', nameKo: '간사이 국제공항',
      city: 'Osaka', cityKo: '오사카',
      country: 'Japan', countryKo: '일본',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 34.4273, longitude: 135.2440, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'ITM', icaoCode: 'RJOO',
      name: 'Osaka Itami Airport', nameKo: '오사카 이타미 공항',
      city: 'Osaka', cityKo: '오사카',
      country: 'Japan', countryKo: '일본',
      latitude: 34.7855, longitude: 135.4380, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'NGO', icaoCode: 'RJGG',
      name: 'Chubu Centrair International Airport', nameKo: '주부 센트레아 국제공항',
      city: 'Nagoya', cityKo: '나고야',
      country: 'Japan', countryKo: '일본',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 34.8584, longitude: 136.8054, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'FUK', icaoCode: 'RJFF',
      name: 'Fukuoka Airport', nameKo: '후쿠오카 공항',
      city: 'Fukuoka', cityKo: '후쿠오카',
      country: 'Japan', countryKo: '일본',
      terminals: ['Domestic', 'International'],
      latitude: 33.5859, longitude: 130.4510, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'CTS', icaoCode: 'RJCC',
      name: 'New Chitose Airport', nameKo: '신치토세 공항',
      city: 'Sapporo', cityKo: '삿포로',
      country: 'Japan', countryKo: '일본',
      terminals: ['Domestic', 'International'],
      latitude: 42.7752, longitude: 141.6925, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'OKA', icaoCode: 'ROAH',
      name: 'Naha Airport', nameKo: '나하 공항',
      city: 'Okinawa', cityKo: '오키나와',
      country: 'Japan', countryKo: '일본',
      terminals: ['Domestic', 'International'],
      latitude: 26.1958, longitude: 127.6459, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'KOJ', icaoCode: 'RJFK',
      name: 'Kagoshima Airport', nameKo: '가고시마 공항',
      city: 'Kagoshima', cityKo: '가고시마',
      country: 'Japan', countryKo: '일본',
      latitude: 31.8034, longitude: 130.7194, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'HIJ', icaoCode: 'RJOA',
      name: 'Hiroshima Airport', nameKo: '히로시마 공항',
      city: 'Hiroshima', cityKo: '히로시마',
      country: 'Japan', countryKo: '일본',
      latitude: 34.4361, longitude: 132.9194, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'SDJ', icaoCode: 'RJSS',
      name: 'Sendai Airport', nameKo: '센다이 공항',
      city: 'Sendai', cityKo: '센다이',
      country: 'Japan', countryKo: '일본',
      latitude: 38.1397, longitude: 140.9171, timezone: 'Asia/Tokyo',
    ),
    Airport(
      iataCode: 'KMQ', icaoCode: 'RJNK',
      name: 'Komatsu Airport', nameKo: '고마쓰 공항',
      city: 'Kanazawa', cityKo: '가나자와',
      country: 'Japan', countryKo: '일본',
      latitude: 36.3946, longitude: 136.4067, timezone: 'Asia/Tokyo',
    ),

    // China
    Airport(
      iataCode: 'PEK', icaoCode: 'ZBAA',
      name: 'Beijing Capital International Airport', nameKo: '베이징 서우두 국제공항',
      city: 'Beijing', cityKo: '베이징',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 40.0799, longitude: 116.6031, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'PKX', icaoCode: 'ZBAD',
      name: 'Beijing Daxing International Airport', nameKo: '베이징 다싱 국제공항',
      city: 'Beijing', cityKo: '베이징',
      country: 'China', countryKo: '중국',
      latitude: 39.5098, longitude: 116.4105, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'PVG', icaoCode: 'ZSPD',
      name: 'Shanghai Pudong International Airport', nameKo: '상하이 푸둥 국제공항',
      city: 'Shanghai', cityKo: '상하이',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 31.1434, longitude: 121.8052, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'SHA', icaoCode: 'ZSSS',
      name: 'Shanghai Hongqiao International Airport', nameKo: '상하이 홍차오 국제공항',
      city: 'Shanghai', cityKo: '상하이',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 31.1979, longitude: 121.3363, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'CAN', icaoCode: 'ZGGG',
      name: 'Guangzhou Baiyun International Airport', nameKo: '광저우 바이윈 국제공항',
      city: 'Guangzhou', cityKo: '광저우',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 23.3924, longitude: 113.2988, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'SZX', icaoCode: 'ZGSZ',
      name: 'Shenzhen Bao\'an International Airport', nameKo: '선전 바오안 국제공항',
      city: 'Shenzhen', cityKo: '선전',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 3'],
      latitude: 22.6393, longitude: 113.8106, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'CTU', icaoCode: 'ZUUU',
      name: 'Chengdu Shuangliu International Airport', nameKo: '청두 솽류 국제공항',
      city: 'Chengdu', cityKo: '청두',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 30.5785, longitude: 103.9471, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'TFU', icaoCode: 'ZUTF',
      name: 'Chengdu Tianfu International Airport', nameKo: '청두 톈푸 국제공항',
      city: 'Chengdu', cityKo: '청두',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 30.3197, longitude: 104.4452, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'HGH', icaoCode: 'ZSHC',
      name: 'Hangzhou Xiaoshan International Airport', nameKo: '항저우 샤오산 국제공항',
      city: 'Hangzhou', cityKo: '항저우',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: 30.2295, longitude: 120.4343, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'XIY', icaoCode: 'ZLXY',
      name: 'Xi\'an Xianyang International Airport', nameKo: '시안 셴양 국제공항',
      city: 'Xi\'an', cityKo: '시안',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 2', 'Terminal 3'],
      latitude: 34.4471, longitude: 108.7516, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'CKG', icaoCode: 'ZUCK',
      name: 'Chongqing Jiangbei International Airport', nameKo: '충칭 장베이 국제공항',
      city: 'Chongqing', cityKo: '충칭',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 2', 'Terminal 3'],
      latitude: 29.7193, longitude: 106.6417, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'NKG', icaoCode: 'ZSNJ',
      name: 'Nanjing Lukou International Airport', nameKo: '난징 루커우 국제공항',
      city: 'Nanjing', cityKo: '난징',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 31.7420, longitude: 118.8620, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'KMG', icaoCode: 'ZPPP',
      name: 'Kunming Changshui International Airport', nameKo: '쿤밍 창수이 국제공항',
      city: 'Kunming', cityKo: '쿤밍',
      country: 'China', countryKo: '중국',
      latitude: 25.1019, longitude: 102.9292, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'WUH', icaoCode: 'ZHHH',
      name: 'Wuhan Tianhe International Airport', nameKo: '우한 톈허 국제공항',
      city: 'Wuhan', cityKo: '우한',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 30.7838, longitude: 114.2081, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'TAO', icaoCode: 'ZSQD',
      name: 'Qingdao Jiaodong International Airport', nameKo: '칭다오 자오둥 국제공항',
      city: 'Qingdao', cityKo: '칭다오',
      country: 'China', countryKo: '중국',
      latitude: 36.2611, longitude: 120.1208, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'DLC', icaoCode: 'ZYTL',
      name: 'Dalian Zhoushuizi International Airport', nameKo: '다롄 저우수이쯔 국제공항',
      city: 'Dalian', cityKo: '다롄',
      country: 'China', countryKo: '중국',
      latitude: 38.9657, longitude: 121.5386, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'XMN', icaoCode: 'ZSAM',
      name: 'Xiamen Gaoqi International Airport', nameKo: '샤먼 가오치 국제공항',
      city: 'Xiamen', cityKo: '샤먼',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 3', 'Terminal 4'],
      latitude: 24.5440, longitude: 118.1278, timezone: 'Asia/Shanghai',
    ),
    Airport(
      iataCode: 'TSN', icaoCode: 'ZBTJ',
      name: 'Tianjin Binhai International Airport', nameKo: '톈진 빈하이 국제공항',
      city: 'Tianjin', cityKo: '톈진',
      country: 'China', countryKo: '중국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 39.1244, longitude: 117.3461, timezone: 'Asia/Shanghai',
    ),

    // Hong Kong, Macau, Taiwan
    Airport(
      iataCode: 'HKG', icaoCode: 'VHHH',
      name: 'Hong Kong International Airport', nameKo: '홍콩 국제공항',
      city: 'Hong Kong', cityKo: '홍콩',
      country: 'Hong Kong', countryKo: '홍콩',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 22.3080, longitude: 113.9185, timezone: 'Asia/Hong_Kong',
    ),
    Airport(
      iataCode: 'MFM', icaoCode: 'VMMC',
      name: 'Macau International Airport', nameKo: '마카오 국제공항',
      city: 'Macau', cityKo: '마카오',
      country: 'Macau', countryKo: '마카오',
      latitude: 22.1496, longitude: 113.5915, timezone: 'Asia/Macau',
    ),
    Airport(
      iataCode: 'TPE', icaoCode: 'RCTP',
      name: 'Taiwan Taoyuan International Airport', nameKo: '타이완 타오위안 국제공항',
      city: 'Taipei', cityKo: '타이베이',
      country: 'Taiwan', countryKo: '대만',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 25.0797, longitude: 121.2342, timezone: 'Asia/Taipei',
    ),
    Airport(
      iataCode: 'TSA', icaoCode: 'RCSS',
      name: 'Taipei Songshan Airport', nameKo: '타이베이 쑹산 공항',
      city: 'Taipei', cityKo: '타이베이',
      country: 'Taiwan', countryKo: '대만',
      latitude: 25.0694, longitude: 121.5525, timezone: 'Asia/Taipei',
    ),
    Airport(
      iataCode: 'KHH', icaoCode: 'RCKH',
      name: 'Kaohsiung International Airport', nameKo: '가오슝 국제공항',
      city: 'Kaohsiung', cityKo: '가오슝',
      country: 'Taiwan', countryKo: '대만',
      terminals: ['Domestic', 'International'],
      latitude: 22.5771, longitude: 120.3500, timezone: 'Asia/Taipei',
    ),

    // Southeast Asia
    Airport(
      iataCode: 'SIN', icaoCode: 'WSSS',
      name: 'Singapore Changi Airport', nameKo: '싱가포르 창이 공항',
      city: 'Singapore', cityKo: '싱가포르',
      country: 'Singapore', countryKo: '싱가포르',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: 1.3644, longitude: 103.9915, timezone: 'Asia/Singapore',
    ),
    Airport(
      iataCode: 'BKK', icaoCode: 'VTBS',
      name: 'Suvarnabhumi Airport', nameKo: '수완나품 공항',
      city: 'Bangkok', cityKo: '방콕',
      country: 'Thailand', countryKo: '태국',
      latitude: 13.6900, longitude: 100.7501, timezone: 'Asia/Bangkok',
    ),
    Airport(
      iataCode: 'DMK', icaoCode: 'VTBD',
      name: 'Don Mueang International Airport', nameKo: '돈므앙 국제공항',
      city: 'Bangkok', cityKo: '방콕',
      country: 'Thailand', countryKo: '태국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 13.9126, longitude: 100.6068, timezone: 'Asia/Bangkok',
    ),
    Airport(
      iataCode: 'HKT', icaoCode: 'VTSP',
      name: 'Phuket International Airport', nameKo: '푸켓 국제공항',
      city: 'Phuket', cityKo: '푸켓',
      country: 'Thailand', countryKo: '태국',
      terminals: ['Domestic', 'International'],
      latitude: 8.1132, longitude: 98.3169, timezone: 'Asia/Bangkok',
    ),
    Airport(
      iataCode: 'CNX', icaoCode: 'VTCC',
      name: 'Chiang Mai International Airport', nameKo: '치앙마이 국제공항',
      city: 'Chiang Mai', cityKo: '치앙마이',
      country: 'Thailand', countryKo: '태국',
      terminals: ['Domestic', 'International'],
      latitude: 18.7667, longitude: 98.9628, timezone: 'Asia/Bangkok',
    ),
    Airport(
      iataCode: 'KUL', icaoCode: 'WMKK',
      name: 'Kuala Lumpur International Airport', nameKo: '쿠알라룸푸르 국제공항',
      city: 'Kuala Lumpur', cityKo: '쿠알라룸푸르',
      country: 'Malaysia', countryKo: '말레이시아',
      terminals: ['KLIA', 'KLIA2'],
      latitude: 2.7456, longitude: 101.7099, timezone: 'Asia/Kuala_Lumpur',
    ),
    Airport(
      iataCode: 'PEN', icaoCode: 'WMKP',
      name: 'Penang International Airport', nameKo: '페낭 국제공항',
      city: 'Penang', cityKo: '페낭',
      country: 'Malaysia', countryKo: '말레이시아',
      latitude: 5.2972, longitude: 100.2767, timezone: 'Asia/Kuala_Lumpur',
    ),
    Airport(
      iataCode: 'BKI', icaoCode: 'WBKK',
      name: 'Kota Kinabalu International Airport', nameKo: '코타키나발루 국제공항',
      city: 'Kota Kinabalu', cityKo: '코타키나발루',
      country: 'Malaysia', countryKo: '말레이시아',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 5.9372, longitude: 116.0510, timezone: 'Asia/Kuala_Lumpur',
    ),
    Airport(
      iataCode: 'SGN', icaoCode: 'VVTS',
      name: 'Tan Son Nhat International Airport', nameKo: '떤선녓 국제공항',
      city: 'Ho Chi Minh City', cityKo: '호치민',
      country: 'Vietnam', countryKo: '베트남',
      terminals: ['Domestic', 'International'],
      latitude: 10.8188, longitude: 106.6519, timezone: 'Asia/Ho_Chi_Minh',
    ),
    Airport(
      iataCode: 'HAN', icaoCode: 'VVNB',
      name: 'Noi Bai International Airport', nameKo: '노이바이 국제공항',
      city: 'Hanoi', cityKo: '하노이',
      country: 'Vietnam', countryKo: '베트남',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 21.2212, longitude: 105.8072, timezone: 'Asia/Ho_Chi_Minh',
    ),
    Airport(
      iataCode: 'DAD', icaoCode: 'VVDN',
      name: 'Da Nang International Airport', nameKo: '다낭 국제공항',
      city: 'Da Nang', cityKo: '다낭',
      country: 'Vietnam', countryKo: '베트남',
      terminals: ['Domestic', 'International'],
      latitude: 16.0439, longitude: 108.1994, timezone: 'Asia/Ho_Chi_Minh',
    ),
    Airport(
      iataCode: 'CXR', icaoCode: 'VVCR',
      name: 'Cam Ranh International Airport', nameKo: '깜라인 국제공항',
      city: 'Nha Trang', cityKo: '나트랑',
      country: 'Vietnam', countryKo: '베트남',
      latitude: 11.9982, longitude: 109.2193, timezone: 'Asia/Ho_Chi_Minh',
    ),
    Airport(
      iataCode: 'PQC', icaoCode: 'VVPQ',
      name: 'Phu Quoc International Airport', nameKo: '푸꾸옥 국제공항',
      city: 'Phu Quoc', cityKo: '푸꾸옥',
      country: 'Vietnam', countryKo: '베트남',
      latitude: 10.1700, longitude: 103.9931, timezone: 'Asia/Ho_Chi_Minh',
    ),
    Airport(
      iataCode: 'MNL', icaoCode: 'RPLL',
      name: 'Ninoy Aquino International Airport', nameKo: '니노이 아키노 국제공항',
      city: 'Manila', cityKo: '마닐라',
      country: 'Philippines', countryKo: '필리핀',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: 14.5086, longitude: 121.0197, timezone: 'Asia/Manila',
    ),
    Airport(
      iataCode: 'CEB', icaoCode: 'RPVM',
      name: 'Mactan-Cebu International Airport', nameKo: '막탄-세부 국제공항',
      city: 'Cebu', cityKo: '세부',
      country: 'Philippines', countryKo: '필리핀',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 10.3075, longitude: 123.9794, timezone: 'Asia/Manila',
    ),
    Airport(
      iataCode: 'CGK', icaoCode: 'WIII',
      name: 'Soekarno-Hatta International Airport', nameKo: '수카르노-하타 국제공항',
      city: 'Jakarta', cityKo: '자카르타',
      country: 'Indonesia', countryKo: '인도네시아',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: -6.1256, longitude: 106.6559, timezone: 'Asia/Jakarta',
    ),
    Airport(
      iataCode: 'DPS', icaoCode: 'WADD',
      name: 'Ngurah Rai International Airport', nameKo: '응우라라이 국제공항',
      city: 'Bali', cityKo: '발리',
      country: 'Indonesia', countryKo: '인도네시아',
      terminals: ['Domestic', 'International'],
      latitude: -8.7482, longitude: 115.1672, timezone: 'Asia/Makassar',
    ),
    Airport(
      iataCode: 'REP', icaoCode: 'VDSR',
      name: 'Siem Reap International Airport', nameKo: '씨엠립 국제공항',
      city: 'Siem Reap', cityKo: '씨엠립',
      country: 'Cambodia', countryKo: '캄보디아',
      latitude: 13.4107, longitude: 103.8128, timezone: 'Asia/Phnom_Penh',
    ),
    Airport(
      iataCode: 'PNH', icaoCode: 'VDPP',
      name: 'Phnom Penh International Airport', nameKo: '프놈펜 국제공항',
      city: 'Phnom Penh', cityKo: '프놈펜',
      country: 'Cambodia', countryKo: '캄보디아',
      latitude: 11.5466, longitude: 104.8441, timezone: 'Asia/Phnom_Penh',
    ),
    Airport(
      iataCode: 'VTE', icaoCode: 'VLVT',
      name: 'Wattay International Airport', nameKo: '왓타이 국제공항',
      city: 'Vientiane', cityKo: '비엔티안',
      country: 'Laos', countryKo: '라오스',
      latitude: 17.9883, longitude: 102.5633, timezone: 'Asia/Vientiane',
    ),
    Airport(
      iataCode: 'RGN', icaoCode: 'VYYY',
      name: 'Yangon International Airport', nameKo: '양곤 국제공항',
      city: 'Yangon', cityKo: '양곤',
      country: 'Myanmar', countryKo: '미얀마',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 16.9073, longitude: 96.1332, timezone: 'Asia/Yangon',
    ),

    // South Asia
    Airport(
      iataCode: 'DEL', icaoCode: 'VIDP',
      name: 'Indira Gandhi International Airport', nameKo: '인디라 간디 국제공항',
      city: 'New Delhi', cityKo: '뉴델리',
      country: 'India', countryKo: '인도',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 28.5562, longitude: 77.1000, timezone: 'Asia/Kolkata',
    ),
    Airport(
      iataCode: 'BOM', icaoCode: 'VABB',
      name: 'Chhatrapati Shivaji International Airport', nameKo: '차트라파티 시바지 국제공항',
      city: 'Mumbai', cityKo: '뭄바이',
      country: 'India', countryKo: '인도',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 19.0896, longitude: 72.8656, timezone: 'Asia/Kolkata',
    ),
    Airport(
      iataCode: 'BLR', icaoCode: 'VOBL',
      name: 'Kempegowda International Airport', nameKo: '켐페고다 국제공항',
      city: 'Bangalore', cityKo: '방갈로르',
      country: 'India', countryKo: '인도',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 13.1986, longitude: 77.7066, timezone: 'Asia/Kolkata',
    ),
    Airport(
      iataCode: 'CMB', icaoCode: 'VCBI',
      name: 'Bandaranaike International Airport', nameKo: '반다라나이케 국제공항',
      city: 'Colombo', cityKo: '콜롬보',
      country: 'Sri Lanka', countryKo: '스리랑카',
      latitude: 7.1808, longitude: 79.8841, timezone: 'Asia/Colombo',
    ),
    Airport(
      iataCode: 'MLE', icaoCode: 'VRMM',
      name: 'Velana International Airport', nameKo: '벨라나 국제공항',
      city: 'Male', cityKo: '말레',
      country: 'Maldives', countryKo: '몰디브',
      latitude: 4.1918, longitude: 73.5290, timezone: 'Indian/Maldives',
    ),
    Airport(
      iataCode: 'KTM', icaoCode: 'VNKT',
      name: 'Tribhuvan International Airport', nameKo: '트리부반 국제공항',
      city: 'Kathmandu', cityKo: '카트만두',
      country: 'Nepal', countryKo: '네팔',
      terminals: ['Domestic', 'International'],
      latitude: 27.6966, longitude: 85.3591, timezone: 'Asia/Kathmandu',
    ),

    // Middle East
    Airport(
      iataCode: 'DXB', icaoCode: 'OMDB',
      name: 'Dubai International Airport', nameKo: '두바이 국제공항',
      city: 'Dubai', cityKo: '두바이',
      country: 'UAE', countryKo: '아랍에미리트',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 25.2532, longitude: 55.3657, timezone: 'Asia/Dubai',
    ),
    Airport(
      iataCode: 'DWC', icaoCode: 'OMDW',
      name: 'Al Maktoum International Airport', nameKo: '알 막툼 국제공항',
      city: 'Dubai', cityKo: '두바이',
      country: 'UAE', countryKo: '아랍에미리트',
      latitude: 24.8961, longitude: 55.1614, timezone: 'Asia/Dubai',
    ),
    Airport(
      iataCode: 'AUH', icaoCode: 'OMAA',
      name: 'Abu Dhabi International Airport', nameKo: '아부다비 국제공항',
      city: 'Abu Dhabi', cityKo: '아부다비',
      country: 'UAE', countryKo: '아랍에미리트',
      terminals: ['Terminal A', 'Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 24.4330, longitude: 54.6511, timezone: 'Asia/Dubai',
    ),
    Airport(
      iataCode: 'DOH', icaoCode: 'OTHH',
      name: 'Hamad International Airport', nameKo: '하마드 국제공항',
      city: 'Doha', cityKo: '도하',
      country: 'Qatar', countryKo: '카타르',
      latitude: 25.2731, longitude: 51.6081, timezone: 'Asia/Qatar',
    ),
    Airport(
      iataCode: 'IST', icaoCode: 'LTFM',
      name: 'Istanbul Airport', nameKo: '이스탄불 공항',
      city: 'Istanbul', cityKo: '이스탄불',
      country: 'Turkey', countryKo: '터키',
      latitude: 41.2753, longitude: 28.7519, timezone: 'Europe/Istanbul',
    ),
    Airport(
      iataCode: 'SAW', icaoCode: 'LTFJ',
      name: 'Sabiha Gokcen International Airport', nameKo: '사비하 괵첸 국제공항',
      city: 'Istanbul', cityKo: '이스탄불',
      country: 'Turkey', countryKo: '터키',
      latitude: 40.8986, longitude: 29.3092, timezone: 'Europe/Istanbul',
    ),
    Airport(
      iataCode: 'TLV', icaoCode: 'LLBG',
      name: 'Ben Gurion Airport', nameKo: '벤 구리온 공항',
      city: 'Tel Aviv', cityKo: '텔아비브',
      country: 'Israel', countryKo: '이스라엘',
      terminals: ['Terminal 1', 'Terminal 3'],
      latitude: 32.0114, longitude: 34.8867, timezone: 'Asia/Jerusalem',
    ),

    // Europe
    Airport(
      iataCode: 'LHR', icaoCode: 'EGLL',
      name: 'London Heathrow Airport', nameKo: '런던 히드로 공항',
      city: 'London', cityKo: '런던',
      country: 'United Kingdom', countryKo: '영국',
      terminals: ['Terminal 2', 'Terminal 3', 'Terminal 4', 'Terminal 5'],
      latitude: 51.4700, longitude: -0.4543, timezone: 'Europe/London',
    ),
    Airport(
      iataCode: 'LGW', icaoCode: 'EGKK',
      name: 'London Gatwick Airport', nameKo: '런던 개트윅 공항',
      city: 'London', cityKo: '런던',
      country: 'United Kingdom', countryKo: '영국',
      terminals: ['North Terminal', 'South Terminal'],
      latitude: 51.1537, longitude: -0.1821, timezone: 'Europe/London',
    ),
    Airport(
      iataCode: 'CDG', icaoCode: 'LFPG',
      name: 'Charles de Gaulle Airport', nameKo: '샤를 드 골 공항',
      city: 'Paris', cityKo: '파리',
      country: 'France', countryKo: '프랑스',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 49.0097, longitude: 2.5478, timezone: 'Europe/Paris',
    ),
    Airport(
      iataCode: 'ORY', icaoCode: 'LFPO',
      name: 'Paris Orly Airport', nameKo: '파리 오를리 공항',
      city: 'Paris', cityKo: '파리',
      country: 'France', countryKo: '프랑스',
      terminals: ['Orly 1', 'Orly 2', 'Orly 3', 'Orly 4'],
      latitude: 48.7262, longitude: 2.3652, timezone: 'Europe/Paris',
    ),
    Airport(
      iataCode: 'FRA', icaoCode: 'EDDF',
      name: 'Frankfurt Airport', nameKo: '프랑크푸르트 공항',
      city: 'Frankfurt', cityKo: '프랑크푸르트',
      country: 'Germany', countryKo: '독일',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 50.0379, longitude: 8.5622, timezone: 'Europe/Berlin',
    ),
    Airport(
      iataCode: 'MUC', icaoCode: 'EDDM',
      name: 'Munich Airport', nameKo: '뮌헨 공항',
      city: 'Munich', cityKo: '뮌헨',
      country: 'Germany', countryKo: '독일',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 48.3537, longitude: 11.7750, timezone: 'Europe/Berlin',
    ),
    Airport(
      iataCode: 'AMS', icaoCode: 'EHAM',
      name: 'Amsterdam Schiphol Airport', nameKo: '암스테르담 스키폴 공항',
      city: 'Amsterdam', cityKo: '암스테르담',
      country: 'Netherlands', countryKo: '네덜란드',
      latitude: 52.3105, longitude: 4.7683, timezone: 'Europe/Amsterdam',
    ),
    Airport(
      iataCode: 'FCO', icaoCode: 'LIRF',
      name: 'Leonardo da Vinci International Airport', nameKo: '레오나르도 다 빈치 국제공항',
      city: 'Rome', cityKo: '로마',
      country: 'Italy', countryKo: '이탈리아',
      terminals: ['Terminal 1', 'Terminal 3'],
      latitude: 41.8003, longitude: 12.2389, timezone: 'Europe/Rome',
    ),
    Airport(
      iataCode: 'MXP', icaoCode: 'LIMC',
      name: 'Milan Malpensa Airport', nameKo: '밀라노 말펜사 공항',
      city: 'Milan', cityKo: '밀라노',
      country: 'Italy', countryKo: '이탈리아',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 45.6301, longitude: 8.7231, timezone: 'Europe/Rome',
    ),
    Airport(
      iataCode: 'MAD', icaoCode: 'LEMD',
      name: 'Adolfo Suarez Madrid-Barajas Airport', nameKo: '아돌포 수아레스 마드리드-바라하스 공항',
      city: 'Madrid', cityKo: '마드리드',
      country: 'Spain', countryKo: '스페인',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: 40.4983, longitude: -3.5676, timezone: 'Europe/Madrid',
    ),
    Airport(
      iataCode: 'BCN', icaoCode: 'LEBL',
      name: 'Barcelona-El Prat Airport', nameKo: '바르셀로나-엘프라트 공항',
      city: 'Barcelona', cityKo: '바르셀로나',
      country: 'Spain', countryKo: '스페인',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 41.2974, longitude: 2.0833, timezone: 'Europe/Madrid',
    ),
    Airport(
      iataCode: 'ZRH', icaoCode: 'LSZH',
      name: 'Zurich Airport', nameKo: '취리히 공항',
      city: 'Zurich', cityKo: '취리히',
      country: 'Switzerland', countryKo: '스위스',
      latitude: 47.4647, longitude: 8.5492, timezone: 'Europe/Zurich',
    ),
    Airport(
      iataCode: 'VIE', icaoCode: 'LOWW',
      name: 'Vienna International Airport', nameKo: '빈 국제공항',
      city: 'Vienna', cityKo: '빈',
      country: 'Austria', countryKo: '오스트리아',
      terminals: ['Terminal 1', 'Terminal 3'],
      latitude: 48.1103, longitude: 16.5697, timezone: 'Europe/Vienna',
    ),
    Airport(
      iataCode: 'PRG', icaoCode: 'LKPR',
      name: 'Vaclav Havel Airport Prague', nameKo: '바츨라프 하벨 프라하 공항',
      city: 'Prague', cityKo: '프라하',
      country: 'Czech Republic', countryKo: '체코',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 50.1008, longitude: 14.2600, timezone: 'Europe/Prague',
    ),
    Airport(
      iataCode: 'BUD', icaoCode: 'LHBP',
      name: 'Budapest Ferenc Liszt International Airport', nameKo: '부다페스트 페렌츠 리스트 국제공항',
      city: 'Budapest', cityKo: '부다페스트',
      country: 'Hungary', countryKo: '헝가리',
      terminals: ['Terminal 2A', 'Terminal 2B'],
      latitude: 47.4369, longitude: 19.2556, timezone: 'Europe/Budapest',
    ),
    Airport(
      iataCode: 'WAW', icaoCode: 'EPWA',
      name: 'Warsaw Chopin Airport', nameKo: '바르샤바 쇼팽 공항',
      city: 'Warsaw', cityKo: '바르샤바',
      country: 'Poland', countryKo: '폴란드',
      latitude: 52.1657, longitude: 20.9671, timezone: 'Europe/Warsaw',
    ),
    Airport(
      iataCode: 'ATH', icaoCode: 'LGAV',
      name: 'Athens International Airport', nameKo: '아테네 국제공항',
      city: 'Athens', cityKo: '아테네',
      country: 'Greece', countryKo: '그리스',
      latitude: 37.9364, longitude: 23.9475, timezone: 'Europe/Athens',
    ),
    Airport(
      iataCode: 'OSL', icaoCode: 'ENGM',
      name: 'Oslo Gardermoen Airport', nameKo: '오슬로 가르데르모엔 공항',
      city: 'Oslo', cityKo: '오슬로',
      country: 'Norway', countryKo: '노르웨이',
      latitude: 60.1975, longitude: 11.1004, timezone: 'Europe/Oslo',
    ),
    Airport(
      iataCode: 'ARN', icaoCode: 'ESSA',
      name: 'Stockholm Arlanda Airport', nameKo: '스톡홀름 알란다 공항',
      city: 'Stockholm', cityKo: '스톡홀름',
      country: 'Sweden', countryKo: '스웨덴',
      terminals: ['Terminal 2', 'Terminal 5'],
      latitude: 59.6519, longitude: 17.9186, timezone: 'Europe/Stockholm',
    ),
    Airport(
      iataCode: 'CPH', icaoCode: 'EKCH',
      name: 'Copenhagen Airport', nameKo: '코펜하겐 공항',
      city: 'Copenhagen', cityKo: '코펜하겐',
      country: 'Denmark', countryKo: '덴마크',
      terminals: ['Terminal 2', 'Terminal 3'],
      latitude: 55.6180, longitude: 12.6508, timezone: 'Europe/Copenhagen',
    ),
    Airport(
      iataCode: 'HEL', icaoCode: 'EFHK',
      name: 'Helsinki-Vantaa Airport', nameKo: '헬싱키-반타 공항',
      city: 'Helsinki', cityKo: '헬싱키',
      country: 'Finland', countryKo: '핀란드',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 60.3172, longitude: 24.9633, timezone: 'Europe/Helsinki',
    ),
    Airport(
      iataCode: 'DUB', icaoCode: 'EIDW',
      name: 'Dublin Airport', nameKo: '더블린 공항',
      city: 'Dublin', cityKo: '더블린',
      country: 'Ireland', countryKo: '아일랜드',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 53.4264, longitude: -6.2499, timezone: 'Europe/Dublin',
    ),
    Airport(
      iataCode: 'LIS', icaoCode: 'LPPT',
      name: 'Lisbon Portela Airport', nameKo: '리스본 포르텔라 공항',
      city: 'Lisbon', cityKo: '리스본',
      country: 'Portugal', countryKo: '포르투갈',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 38.7813, longitude: -9.1359, timezone: 'Europe/Lisbon',
    ),
    Airport(
      iataCode: 'BRU', icaoCode: 'EBBR',
      name: 'Brussels Airport', nameKo: '브뤼셀 공항',
      city: 'Brussels', cityKo: '브뤼셀',
      country: 'Belgium', countryKo: '벨기에',
      latitude: 50.9014, longitude: 4.4844, timezone: 'Europe/Brussels',
    ),

    // North America
    Airport(
      iataCode: 'JFK', icaoCode: 'KJFK',
      name: 'John F. Kennedy International Airport', nameKo: '존 F. 케네디 국제공항',
      city: 'New York', cityKo: '뉴욕',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 4', 'Terminal 5', 'Terminal 7', 'Terminal 8'],
      latitude: 40.6413, longitude: -73.7781, timezone: 'America/New_York',
    ),
    Airport(
      iataCode: 'EWR', icaoCode: 'KEWR',
      name: 'Newark Liberty International Airport', nameKo: '뉴어크 리버티 국제공항',
      city: 'Newark', cityKo: '뉴어크',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal A', 'Terminal B', 'Terminal C'],
      latitude: 40.6895, longitude: -74.1745, timezone: 'America/New_York',
    ),
    Airport(
      iataCode: 'LAX', icaoCode: 'KLAX',
      name: 'Los Angeles International Airport', nameKo: '로스앤젤레스 국제공항',
      city: 'Los Angeles', cityKo: '로스앤젤레스',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4', 'Terminal 5', 'Terminal 6', 'Terminal 7', 'Terminal 8', 'Tom Bradley International'],
      latitude: 33.9416, longitude: -118.4085, timezone: 'America/Los_Angeles',
    ),
    Airport(
      iataCode: 'SFO', icaoCode: 'KSFO',
      name: 'San Francisco International Airport', nameKo: '샌프란시스코 국제공항',
      city: 'San Francisco', cityKo: '샌프란시스코',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'International Terminal'],
      latitude: 37.6213, longitude: -122.3790, timezone: 'America/Los_Angeles',
    ),
    Airport(
      iataCode: 'ORD', icaoCode: 'KORD',
      name: 'O\'Hare International Airport', nameKo: '오헤어 국제공항',
      city: 'Chicago', cityKo: '시카고',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 5'],
      latitude: 41.9742, longitude: -87.9073, timezone: 'America/Chicago',
    ),
    Airport(
      iataCode: 'ATL', icaoCode: 'KATL',
      name: 'Hartsfield-Jackson Atlanta International Airport', nameKo: '하츠필드-잭슨 애틀랜타 국제공항',
      city: 'Atlanta', cityKo: '애틀랜타',
      country: 'United States', countryKo: '미국',
      terminals: ['Domestic Terminal', 'International Terminal'],
      latitude: 33.6407, longitude: -84.4277, timezone: 'America/New_York',
    ),
    Airport(
      iataCode: 'DFW', icaoCode: 'KDFW',
      name: 'Dallas/Fort Worth International Airport', nameKo: '댈러스/포트워스 국제공항',
      city: 'Dallas', cityKo: '댈러스',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal A', 'Terminal B', 'Terminal C', 'Terminal D', 'Terminal E'],
      latitude: 32.8998, longitude: -97.0403, timezone: 'America/Chicago',
    ),
    Airport(
      iataCode: 'DEN', icaoCode: 'KDEN',
      name: 'Denver International Airport', nameKo: '덴버 국제공항',
      city: 'Denver', cityKo: '덴버',
      country: 'United States', countryKo: '미국',
      terminals: ['Jeppesen Terminal'],
      latitude: 39.8561, longitude: -104.6737, timezone: 'America/Denver',
    ),
    Airport(
      iataCode: 'SEA', icaoCode: 'KSEA',
      name: 'Seattle-Tacoma International Airport', nameKo: '시애틀-터코마 국제공항',
      city: 'Seattle', cityKo: '시애틀',
      country: 'United States', countryKo: '미국',
      latitude: 47.4502, longitude: -122.3088, timezone: 'America/Los_Angeles',
    ),
    Airport(
      iataCode: 'MIA', icaoCode: 'KMIA',
      name: 'Miami International Airport', nameKo: '마이애미 국제공항',
      city: 'Miami', cityKo: '마이애미',
      country: 'United States', countryKo: '미국',
      terminals: ['North Terminal', 'Central Terminal', 'South Terminal'],
      latitude: 25.7959, longitude: -80.2870, timezone: 'America/New_York',
    ),
    Airport(
      iataCode: 'BOS', icaoCode: 'KBOS',
      name: 'Boston Logan International Airport', nameKo: '보스턴 로건 국제공항',
      city: 'Boston', cityKo: '보스턴',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal A', 'Terminal B', 'Terminal C', 'Terminal E'],
      latitude: 42.3656, longitude: -71.0096, timezone: 'America/New_York',
    ),
    Airport(
      iataCode: 'IAD', icaoCode: 'KIAD',
      name: 'Washington Dulles International Airport', nameKo: '워싱턴 덜레스 국제공항',
      city: 'Washington D.C.', cityKo: '워싱턴 D.C.',
      country: 'United States', countryKo: '미국',
      latitude: 38.9531, longitude: -77.4565, timezone: 'America/New_York',
    ),
    Airport(
      iataCode: 'LAS', icaoCode: 'KLAS',
      name: 'Harry Reid International Airport', nameKo: '해리 리드 국제공항',
      city: 'Las Vegas', cityKo: '라스베이거스',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal 1', 'Terminal 3'],
      latitude: 36.0840, longitude: -115.1537, timezone: 'America/Los_Angeles',
    ),
    Airport(
      iataCode: 'HNL', icaoCode: 'PHNL',
      name: 'Daniel K. Inouye International Airport', nameKo: '다니엘 K. 이노우에 국제공항',
      city: 'Honolulu', cityKo: '호놀룰루',
      country: 'United States', countryKo: '미국',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 21.3187, longitude: -157.9225, timezone: 'Pacific/Honolulu',
    ),
    Airport(
      iataCode: 'YYZ', icaoCode: 'CYYZ',
      name: 'Toronto Pearson International Airport', nameKo: '토론토 피어슨 국제공항',
      city: 'Toronto', cityKo: '토론토',
      country: 'Canada', countryKo: '캐나다',
      terminals: ['Terminal 1', 'Terminal 3'],
      latitude: 43.6777, longitude: -79.6248, timezone: 'America/Toronto',
    ),
    Airport(
      iataCode: 'YVR', icaoCode: 'CYVR',
      name: 'Vancouver International Airport', nameKo: '밴쿠버 국제공항',
      city: 'Vancouver', cityKo: '밴쿠버',
      country: 'Canada', countryKo: '캐나다',
      terminals: ['Domestic', 'International'],
      latitude: 49.1967, longitude: -123.1815, timezone: 'America/Vancouver',
    ),
    Airport(
      iataCode: 'YUL', icaoCode: 'CYUL',
      name: 'Montreal-Pierre Elliott Trudeau International Airport', nameKo: '몬트리올-피에르 엘리오트 트뤼도 국제공항',
      city: 'Montreal', cityKo: '몬트리올',
      country: 'Canada', countryKo: '캐나다',
      latitude: 45.4706, longitude: -73.7408, timezone: 'America/Toronto',
    ),
    Airport(
      iataCode: 'MEX', icaoCode: 'MMMX',
      name: 'Mexico City International Airport', nameKo: '멕시코시티 국제공항',
      city: 'Mexico City', cityKo: '멕시코시티',
      country: 'Mexico', countryKo: '멕시코',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 19.4361, longitude: -99.0719, timezone: 'America/Mexico_City',
    ),
    Airport(
      iataCode: 'CUN', icaoCode: 'MMUN',
      name: 'Cancun International Airport', nameKo: '칸쿤 국제공항',
      city: 'Cancun', cityKo: '칸쿤',
      country: 'Mexico', countryKo: '멕시코',
      terminals: ['Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: 21.0365, longitude: -86.8771, timezone: 'America/Cancun',
    ),

    // South America
    Airport(
      iataCode: 'GRU', icaoCode: 'SBGR',
      name: 'Sao Paulo-Guarulhos International Airport', nameKo: '상파울루-과룰류스 국제공항',
      city: 'Sao Paulo', cityKo: '상파울루',
      country: 'Brazil', countryKo: '브라질',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: -23.4356, longitude: -46.4731, timezone: 'America/Sao_Paulo',
    ),
    Airport(
      iataCode: 'GIG', icaoCode: 'SBGL',
      name: 'Rio de Janeiro-Galeao International Airport', nameKo: '리우데자네이루-갈레앙 국제공항',
      city: 'Rio de Janeiro', cityKo: '리우데자네이루',
      country: 'Brazil', countryKo: '브라질',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: -22.8090, longitude: -43.2506, timezone: 'America/Sao_Paulo',
    ),
    Airport(
      iataCode: 'EZE', icaoCode: 'SAEZ',
      name: 'Buenos Aires Ministro Pistarini International Airport', nameKo: '부에노스아이레스 미니스트로 피스타리니 국제공항',
      city: 'Buenos Aires', cityKo: '부에노스아이레스',
      country: 'Argentina', countryKo: '아르헨티나',
      terminals: ['Terminal A', 'Terminal B', 'Terminal C'],
      latitude: -34.8222, longitude: -58.5358, timezone: 'America/Argentina/Buenos_Aires',
    ),
    Airport(
      iataCode: 'SCL', icaoCode: 'SCEL',
      name: 'Santiago Arturo Merino Benitez International Airport', nameKo: '산티아고 아르투로 메리노 베니테스 국제공항',
      city: 'Santiago', cityKo: '산티아고',
      country: 'Chile', countryKo: '칠레',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: -33.3930, longitude: -70.7858, timezone: 'America/Santiago',
    ),
    Airport(
      iataCode: 'LIM', icaoCode: 'SPJC',
      name: 'Jorge Chavez International Airport', nameKo: '호르헤 차베스 국제공항',
      city: 'Lima', cityKo: '리마',
      country: 'Peru', countryKo: '페루',
      latitude: -12.0219, longitude: -77.1143, timezone: 'America/Lima',
    ),
    Airport(
      iataCode: 'BOG', icaoCode: 'SKBO',
      name: 'El Dorado International Airport', nameKo: '엘도라도 국제공항',
      city: 'Bogota', cityKo: '보고타',
      country: 'Colombia', countryKo: '콜롬비아',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 4.7016, longitude: -74.1469, timezone: 'America/Bogota',
    ),

    // Oceania
    Airport(
      iataCode: 'SYD', icaoCode: 'YSSY',
      name: 'Sydney Kingsford Smith Airport', nameKo: '시드니 킹스포드 스미스 공항',
      city: 'Sydney', cityKo: '시드니',
      country: 'Australia', countryKo: '호주',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: -33.9399, longitude: 151.1753, timezone: 'Australia/Sydney',
    ),
    Airport(
      iataCode: 'MEL', icaoCode: 'YMML',
      name: 'Melbourne Airport', nameKo: '멜버른 공항',
      city: 'Melbourne', cityKo: '멜버른',
      country: 'Australia', countryKo: '호주',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: -37.6690, longitude: 144.8410, timezone: 'Australia/Melbourne',
    ),
    Airport(
      iataCode: 'BNE', icaoCode: 'YBBN',
      name: 'Brisbane Airport', nameKo: '브리즈번 공항',
      city: 'Brisbane', cityKo: '브리즈번',
      country: 'Australia', countryKo: '호주',
      terminals: ['Domestic', 'International'],
      latitude: -27.3942, longitude: 153.1218, timezone: 'Australia/Brisbane',
    ),
    Airport(
      iataCode: 'PER', icaoCode: 'YPPH',
      name: 'Perth Airport', nameKo: '퍼스 공항',
      city: 'Perth', cityKo: '퍼스',
      country: 'Australia', countryKo: '호주',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3', 'Terminal 4'],
      latitude: -31.9385, longitude: 115.9672, timezone: 'Australia/Perth',
    ),
    Airport(
      iataCode: 'AKL', icaoCode: 'NZAA',
      name: 'Auckland Airport', nameKo: '오클랜드 공항',
      city: 'Auckland', cityKo: '오클랜드',
      country: 'New Zealand', countryKo: '뉴질랜드',
      terminals: ['Domestic', 'International'],
      latitude: -37.0082, longitude: 174.7850, timezone: 'Pacific/Auckland',
    ),
    Airport(
      iataCode: 'CHC', icaoCode: 'NZCH',
      name: 'Christchurch Airport', nameKo: '크라이스트처치 공항',
      city: 'Christchurch', cityKo: '크라이스트처치',
      country: 'New Zealand', countryKo: '뉴질랜드',
      terminals: ['Domestic', 'International'],
      latitude: -43.4867, longitude: 172.5322, timezone: 'Pacific/Auckland',
    ),
    Airport(
      iataCode: 'NAN', icaoCode: 'NFFN',
      name: 'Nadi International Airport', nameKo: '나디 국제공항',
      city: 'Nadi', cityKo: '나디',
      country: 'Fiji', countryKo: '피지',
      latitude: -17.7554, longitude: 177.4436, timezone: 'Pacific/Fiji',
    ),

    // Africa
    Airport(
      iataCode: 'JNB', icaoCode: 'FAOR',
      name: 'O.R. Tambo International Airport', nameKo: 'O.R. 탐보 국제공항',
      city: 'Johannesburg', cityKo: '요하네스버그',
      country: 'South Africa', countryKo: '남아프리카공화국',
      terminals: ['Terminal A', 'Terminal B'],
      latitude: -26.1367, longitude: 28.2411, timezone: 'Africa/Johannesburg',
    ),
    Airport(
      iataCode: 'CPT', icaoCode: 'FACT',
      name: 'Cape Town International Airport', nameKo: '케이프타운 국제공항',
      city: 'Cape Town', cityKo: '케이프타운',
      country: 'South Africa', countryKo: '남아프리카공화국',
      terminals: ['Domestic', 'International'],
      latitude: -33.9715, longitude: 18.6021, timezone: 'Africa/Johannesburg',
    ),
    Airport(
      iataCode: 'CAI', icaoCode: 'HECA',
      name: 'Cairo International Airport', nameKo: '카이로 국제공항',
      city: 'Cairo', cityKo: '카이로',
      country: 'Egypt', countryKo: '이집트',
      terminals: ['Terminal 1', 'Terminal 2', 'Terminal 3'],
      latitude: 30.1219, longitude: 31.4056, timezone: 'Africa/Cairo',
    ),
    Airport(
      iataCode: 'CMN', icaoCode: 'GMMN',
      name: 'Mohammed V International Airport', nameKo: '모하메드 5세 국제공항',
      city: 'Casablanca', cityKo: '카사블랑카',
      country: 'Morocco', countryKo: '모로코',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 33.3675, longitude: -7.5900, timezone: 'Africa/Casablanca',
    ),
    Airport(
      iataCode: 'ADD', icaoCode: 'HAAB',
      name: 'Addis Ababa Bole International Airport', nameKo: '아디스아바바 볼레 국제공항',
      city: 'Addis Ababa', cityKo: '아디스아바바',
      country: 'Ethiopia', countryKo: '에티오피아',
      terminals: ['Terminal 1', 'Terminal 2'],
      latitude: 8.9778, longitude: 38.7994, timezone: 'Africa/Addis_Ababa',
    ),
    Airport(
      iataCode: 'NBO', icaoCode: 'HKJK',
      name: 'Jomo Kenyatta International Airport', nameKo: '조모 케냐타 국제공항',
      city: 'Nairobi', cityKo: '나이로비',
      country: 'Kenya', countryKo: '케냐',
      terminals: ['Terminal 1A', 'Terminal 1B', 'Terminal 1C', 'Terminal 1D'],
      latitude: -1.3192, longitude: 36.9278, timezone: 'Africa/Nairobi',
    ),
    Airport(
      iataCode: 'LOS', icaoCode: 'DNMM',
      name: 'Murtala Muhammed International Airport', nameKo: '무르탈라 무함마드 국제공항',
      city: 'Lagos', cityKo: '라고스',
      country: 'Nigeria', countryKo: '나이지리아',
      terminals: ['Domestic', 'International'],
      latitude: 6.5774, longitude: 3.3212, timezone: 'Africa/Lagos',
    ),
    Airport(
      iataCode: 'MRU', icaoCode: 'FIMP',
      name: 'Sir Seewoosagur Ramgoolam International Airport', nameKo: '시 시우사구르 람굴람 국제공항',
      city: 'Mauritius', cityKo: '모리셔스',
      country: 'Mauritius', countryKo: '모리셔스',
      latitude: -20.4302, longitude: 57.6836, timezone: 'Indian/Mauritius',
    ),
  ];

  static List<Airport> search(String query) {
    if (query.isEmpty) return [];

    final results = airports.where((airport) => airport.matchesQuery(query)).toList();

    // Sort by relevance: exact IATA match first, then starts with, then contains
    results.sort((a, b) {
      final q = query.toUpperCase();
      final aCode = a.iataCode.toUpperCase();
      final bCode = b.iataCode.toUpperCase();

      // Exact IATA code match
      if (aCode == q && bCode != q) return -1;
      if (bCode == q && aCode != q) return 1;

      // IATA code starts with
      if (aCode.startsWith(q) && !bCode.startsWith(q)) return -1;
      if (bCode.startsWith(q) && !aCode.startsWith(q)) return 1;

      // City name starts with
      final aCity = a.city.toUpperCase();
      final bCity = b.city.toUpperCase();
      if (aCity.startsWith(q) && !bCity.startsWith(q)) return -1;
      if (bCity.startsWith(q) && !aCity.startsWith(q)) return 1;

      return a.city.compareTo(b.city);
    });

    return results.take(20).toList();
  }

  static Airport? findByCode(String code) {
    try {
      return airports.firstWhere(
        (airport) => airport.iataCode.toUpperCase() == code.toUpperCase() ||
                     airport.icaoCode.toUpperCase() == code.toUpperCase(),
      );
    } catch (_) {
      return null;
    }
  }
}
