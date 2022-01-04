import 'package:app_auth/core/shared/app_size_config.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color defaultBlue = Color(0xFF004B87);
  static const Color defaultBlue20 = Color(0xFFCCDBE7);
  static const Color defaultBlue80 = Color(0xFF336F9F);
  static const Color white = Colors.white;
  static LinearGradient gradientBlue = LinearGradient(colors: [
    Color(0xFF004B87),
    Color(0xFF0083C1),
  ], begin: Alignment.centerLeft, end: Alignment.topRight);
  static const Color defaultYellow = Color(0xFFFFDB0F);
  static const Color defaultGreen = Color(0xFF4AB844);
  static const Color defaultOrange = Color(0xFFE99009);

  static const Color corTopBar = Color(0xFF9BD136);
  static LinearGradient corBotao = LinearGradient(colors: [
    Color(0xFF82ba50),
    Color(0xFFbdd246),
  ], begin: Alignment.bottomRight, end: Alignment.topLeft);
  static LinearGradient corAppBar = LinearGradient(colors: [
    Color(0xFF82ba50),
    Color(0xFFbdd246),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static const Color corDentroBotao = Colors.white;

  static const Color defaultGrey = Color(0xFF9AA4C1);

  static const Color corTitulo = Color(0xFF30615f);
  static const Color corSubTitulo1 = Color(0xFFFFFFFF);
  static const Color corTexto = defaultBlue;
  static const Color corSubTitulo2 = Color(0xFFbdd246);
  static const Color corContainer = Color(0xFFf2f5d5);
  static const Color corTopContainer = Color(0xFFe1e5c1);
  static const Color corPerfil = Color(0xFF70BA3F);

  static final Color heading = Color(0xFF585666);
  static final Color background = Color(0xFFFFFFFF);
  static final Color stroke = Color(0xFFE3E3E6);
  static final Color input = Color(0xFFB1B0B8);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    appBarTheme: AppBarTheme(color: defaultBlue.withOpacity(0.5)),
    errorColor: corTexto,
    unselectedWidgetColor: defaultBlue,
    canvasColor: white,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
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

  static final TextTheme darkTextTheme = TextTheme(
    headline1: _tituloDark,
    subtitle1: _subTituloDark,
    button: _botaoDark,
    headline4: _botao2Dark,
    headline3: _searchDark,
    bodyText2: _selectedTabDark,
  );

  static final TextStyle _tituloLight = TextStyle(
    color: corTitulo,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 4.5 * AppSize.textMultiplier!,
  );

  static final TextStyle _titulo2Light = TextStyle(
    color: corSubTitulo2,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 3 * AppSize.textMultiplier!,
  );

  static final TextStyle _subTituloLight = TextStyle(
    color: corSubTitulo1,
    fontFamily: 'OpenSans',
    fontSize: 2 * AppSize.textMultiplier!,
  );

  static final TextStyle _subTitulo2Light = TextStyle(
    color: defaultBlue,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 2 * AppSize.textMultiplier!,
  );

  static final TextStyle _botaoLight = TextStyle(
    color: corDentroBotao,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 3.0 * AppSize.textMultiplier!,
  );

  static final TextStyle _textfieldLight = TextStyle(
    color: corTexto,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 5.0 * AppSize.textMultiplier!,
  );

  static final TextStyle _texto1Light = TextStyle(
      color: corTexto,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
      fontSize: 2.5 * AppSize.textMultiplier!,
      height: 1.5);

  static final TextStyle _texto2Light = TextStyle(
    color: defaultBlue,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 2.4 * AppSize.textMultiplier!,
  );

  static final TextStyle _texto3Light = TextStyle(
      color: defaultBlue,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.normal,
      fontSize: 2.4 * AppSize.textMultiplier!,
      height: 1.5);
  static final TextStyle _botaoDialogLight = TextStyle(
    color: defaultBlue,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    fontSize: 2 * AppSize.textMultiplier!,
  );

  //dark

  static final TextStyle _tituloDark = _tituloLight.copyWith(
    color: Colors.white,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
  );

  static final TextStyle _subTituloDark = _subTituloLight.copyWith(
    color: Colors.white70,
    fontFamily: 'OpenSans',
  );

  static final TextStyle _botaoDark = _botaoLight.copyWith(
    color: Colors.black,
    fontFamily: 'OpenSans',
  );

  static final TextStyle _botao2Dark = _textfieldLight.copyWith(
    color: Colors.black,
    fontFamily: 'OpenSans',
  );

  static final TextStyle _searchDark = _texto1Light.copyWith(
    color: Colors.black,
    fontFamily: 'OpenSans',
  );

  static final TextStyle _selectedTabDark = _texto2Light.copyWith(
    color: Colors.white,
    fontFamily: 'OpenSans',
  );
}
