import 'package:app_auth/core/router/route_generator_service.dart';
import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:app_auth/core/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_injection_container.dart';
import 'modules/home/presentation/bloc/home_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => sl<HomeBloc>(),
        ),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        AppSize().init(constraints);

        return MaterialApp(
          title: 'Auth',
          theme: AppTheme.lightTheme,
          initialRoute: '/auth',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      }),
    );
  }
}
