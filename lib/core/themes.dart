import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'constant.dart';

class AppTheme {
  const AppTheme._();

  static final darkTheme = ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: darkBackgroundColor,
      textTheme: const TextTheme(
        titleMedium: kTextStyle,
        titleLarge: kTextStyleBold,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: darkAccentColor,
    ).copyWith(surface:darkAccentColor),
  );


  static final lightTheme = ThemeData(
      iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: lightBackgroundColor,
    textTheme: const TextTheme(
      titleMedium: kTextStyle,
      titleLarge: kTextStyleBold,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccentColor,
      ).copyWith(surface: lightAccentColor),
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
