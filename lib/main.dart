import 'package:flutter/material.dart';
import 'package:mobile_eticaret/screens/home_screen.dart';
import 'package:mobile_eticaret/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      title: 'Mobile e-ticaret',
      home: HomeScreen(),
    );
  }
}
