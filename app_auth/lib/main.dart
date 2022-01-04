import 'package:app_auth/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      AppWidget(),
    );
  });
}
