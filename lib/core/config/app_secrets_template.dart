/// App secrets template
/// Copy this file to app_secrets.dart and fill in your API keys
/// DO NOT commit app_secrets.dart!

class AppSecrets {
  // Kakao SDK - Get from Kakao Developers Console
  static const String kakaoNativeAppKey = 'YOUR_KAKAO_APP_KEY';
  static const String kakaoCustomScheme = 'kakaoYOUR_KAKAO_APP_KEY';

  // Naver SDK - Get from Naver Developers Console
  static const String naverClientId = 'YOUR_NAVER_CLIENT_ID';
  static const String naverClientSecret = 'YOUR_NAVER_CLIENT_SECRET';
  static const String naverClientName = 'TripSync';

  // RapidAPI - AeroDataBox for flight search
  // Get from https://rapidapi.com/aedbx-aedbx/api/aerodatabox
  static const String rapidApiKey = 'YOUR_RAPIDAPI_KEY';
  static const String rapidApiHost = 'aerodatabox.p.rapidapi.com';
}
