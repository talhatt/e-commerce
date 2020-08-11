import 'package:flutter/material.dart';
import 'package:mobile_eticaret/screens/home_screen.dart';
import 'package:mobile_eticaret/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
