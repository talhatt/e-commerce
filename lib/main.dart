import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobile_eticaret/constants.dart';
import 'package:mobile_eticaret/routes.dart';
import 'package:mobile_eticaret/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kPrimaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        dividerTheme: DividerThemeData(
          space: 20,
          thickness: 1,
          color: kPrimaryColor,
          indent: 20,
          endIndent: 20,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
