import 'package:flutter/material.dart';
import 'package:mobile_eticaret/screens/home_screen.dart';
import 'package:mobile_eticaret/screens/sign_in.dart';
import 'package:mobile_eticaret/screens/sign_up.dart';
import 'package:mobile_eticaret/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
};
