import 'package:app_auth/modules/auth/presentation/pages/auth_page.dart';
import 'package:app_auth/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/auth':
        return MaterialPageRoute(builder: (context) => AuthPage());

      case '/home_page':
        return MaterialPageRoute(builder: (context) => HomePage());

      default:
        return MaterialPageRoute(builder: (context) => AuthPage());
    }
  }
}
