import 'package:flutter/material.dart';
import 'package:save_supermarket/pages/home_page.dart';
import 'package:save_supermarket/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_supermarket/utils/routes.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/",
        routes: {
          "/": (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
        });
  }
}
