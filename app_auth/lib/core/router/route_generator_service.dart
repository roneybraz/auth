import 'package:app_auth/modules/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/auth':
        return MaterialPageRoute(builder: (context) => AuthPage());

      default:
        return MaterialPageRoute(builder: (context) => AuthPage());
    }
  }
}
