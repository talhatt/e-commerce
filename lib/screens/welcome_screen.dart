import 'package:flutter/material.dart';
import 'package:mobile_eticaret/screens/components/body.dart';
import 'package:mobile_eticaret/size_config.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
