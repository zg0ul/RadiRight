class AppConfig {
  AppConfig._();

  static const String appName = 'RadiRight';
  static const String appVersion = '1.0.0';

  // Contact Information (for V1 subscription)
  static const String contactEmail = 'ali.amaierh5@gmail.com';
  static const String contactPhone = '0789113306';

  // Subscription Configuration
  static const int trialDays = 7;
  static const double monthlyPrice = 99.0;
  static const double yearlyPrice = 999.0;

  // API Configuration (for future use)
  static const String baseUrl = '';
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 24);

  // Supported Locales
  static const List<String> supportedLocales = ['en', 'ar'];
  static const String defaultLocale = 'en';
}
