abstract class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String panelSelection = '/assessment/panels';
  static const String topicSelection = '/assessment/topics/:panelId';
  static const String question = '/assessment/question';
  static const String result = '/assessment/result';
  static const String history = '/history';
  static const String historyDetail = '/history/:historyId';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String subscription = '/subscription';
  static const String trialExpired = '/trial-expired';
  static const String contactInfo = '/contact-info';

  static String topicSelectionPath(String panelId) =>
      '/assessment/topics/$panelId';

  static String historyDetailPath(String historyId) => '/history/$historyId';
}
