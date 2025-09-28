class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const history = '/history';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      initial: (_) => const InitialPage(),
      home: (_) => const HomePage(),
      history: (_) => const HistoryPage(),
    };
  }
}
