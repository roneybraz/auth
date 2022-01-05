import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color colorBackgroundBlue = Color(0xFF004B87);
  static const Color colorBackgroundWhite = Color(0xFFffffff);
  static const Color colorButton = Color(0xFF57B952);
  static const Color colorTextButton = Color(0xFFffffff);
  static const Color colorTitle = Color(0xFF004B87);
  static const Color colorSubtitle = Color(0xFF004B87);
  static const Color colorText = Color(0xFF004B87);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    appBarTheme: const AppBarTheme(color: colorBackgroundBlue),
    errorColor: colorText,
    unselectedWidgetColor: colorBackgroundBlue,
    canvasColor: colorBackgroundWhite,
  );

  static final TextTheme lightTextTheme = TextTheme(
      headline1: _tituloLight,
      headline2: _titulo2Light,
      subtitle1: _subTituloLight,
      subtitle2: _subTitulo2Light,
      button: _botaoLight,
      headline4: _textfieldLight,
      headline3: _texto1Light,
      bodyText2: _texto2Light,
      bodyText1: _texto3Light,
      headline5: _botaoDialogLight);

  static final TextStyle _tituloLight = TextStyle(
    color: colorTitle,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 4.0 * AppSize.textMultiplier!,
  );

  static final TextStyle _titulo2Light = TextStyle(
    color: colorSubtitle,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 3 * AppSize.textMultiplier!,
  );

  static final TextStyle _subTituloLight = TextStyle(
    color: Colors.red,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 4.0 * AppSize.textMultiplier!,
  );

  static final TextStyle _subTitulo2Light = TextStyle(
    color: colorSubtitle,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 2 * AppSize.textMultiplier!,
  );

  static final TextStyle _botaoLight = TextStyle(
    color: colorTextButton,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 3.0 * AppSize.textMultiplier!,
  );

  static final TextStyle _textfieldLight = TextStyle(
    color: colorTitle,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 5.0 * AppSize.textMultiplier!,
  );

  static final TextStyle _texto1Light = TextStyle(
      color: colorTitle,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
      fontSize: 2.5 * AppSize.textMultiplier!,
      height: 1.5);

  static final TextStyle _texto2Light = TextStyle(
    color: colorTitle,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 3.8 * AppSize.textMultiplier!,
  );

  static final TextStyle _texto3Light = TextStyle(
      color: colorTitle,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
      fontSize: 3.8 * AppSize.textMultiplier!,
      height: 1.5);

  static final TextStyle _botaoDialogLight = TextStyle(
    color: colorTitle,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 2 * AppSize.textMultiplier!,
  );
}
