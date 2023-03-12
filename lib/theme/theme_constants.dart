import 'package:flutter/material.dart';

const primary = Colors.deepOrangeAccent;
const secondary = Colors.orange;
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
        headlineLarge:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    primaryColor: primary,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: secondary),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none)),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(secondary),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            )))));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primary,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Color(0xffc4c4c4)),
);
