import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timebox/code.services/api.dart';
import 'package:timebox/theme/theme_constants.dart';

import 'providers/user_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/box_provider.dart';
import 'screens/devices.dart';
import 'screens/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (ref) => API()),
        ChangeNotifierProvider(create: (_) => ThemeState()),
        ChangeNotifierProvider(create: (_) => ProfileState()),
        ChangeNotifierProvider(create: (_) => TimeBoxState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeState>().themeMode,
      initialRoute: '/login',
      //home: const Default(),
      routes: {
        '/login': (context) => const Login(),
        '/devices': (context) => const Devices(),
      },
    );
  }
}
