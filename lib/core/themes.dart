import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'constant.dart';

class AppTheme {
  const AppTheme._();

  static final darkTheme = ThemeData(
    accentColor: darkAccentColor ,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: darkBackgroundColor,
    backgroundColor: darkBackgroundColor,
      textTheme: const TextTheme(
        bodyText2: kTextStyle,
        bodyText1: kTextStyleBold,
      ),
  );


  static final lightTheme = ThemeData(
    accentColor: lightAccentColor,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: lightBackgroundColor,
    backgroundColor: lightBackgroundColor,
    textTheme: const TextTheme(
      bodyText2: kTextStyle,
      bodyText1: kTextStyleBold,
    ),
  );

  static Brightness get currentSystemBrightness => SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light ? lightBackgroundColor : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}