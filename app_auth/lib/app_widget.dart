import 'package:app_auth/core/router/route_generator_service.dart';
import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      AppSize().init(constraints);

      return MaterialApp(
        title: 'Auth',
        theme: AppTheme.lightTheme,
        initialRoute: '/auth',
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}
