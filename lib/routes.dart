import 'package:flutter/material.dart';
import 'package:mobile_eticaret/screens/categories.dart';
import 'package:mobile_eticaret/screens/components/cart_screen.dart';
import 'package:mobile_eticaret/screens/components/notification_screen.dart';
import 'package:mobile_eticaret/screens/home_screen.dart';
import 'package:mobile_eticaret/screens/sign_in.dart';
import 'package:mobile_eticaret/screens/sign_up.dart';
import 'package:mobile_eticaret/screens/special_deals.dart';
import 'package:mobile_eticaret/screens/top_rated_products.dart';
import 'package:mobile_eticaret/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  TopRatedProducts.routeName: (context) => TopRatedProducts(),
  SpecialDeals.routeName: (context) => SpecialDeals(),
  Categories.routeName: (context) => Categories(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
