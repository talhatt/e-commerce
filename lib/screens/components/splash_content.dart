import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Spacer(),
          Text("LogDef",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 25),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.orangeAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
