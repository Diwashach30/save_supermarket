import 'package:flutter/material.dart';
import 'package:save_supermarket/pages/home_page.dart';
import 'package:save_supermarket/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/home",
        routes: {
          "/": (context) => new LoginPage(),
          "/home": (context) => HomePage(),
          "/login": (context) => LoginPage(),
        });
  }
}
