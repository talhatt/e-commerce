import 'package:flutter/material.dart';
import 'package:mobile_eticaret/components/default_button.dart';
import 'package:mobile_eticaret/constants.dart';
import 'package:mobile_eticaret/screens/components/splash_content.dart';
import 'package:mobile_eticaret/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _visible = false;
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"image": "assets/images/welcome_1.jpg", "text": "Hoşgeldiniz :)"},
    {
      "image": "assets/images/welcome_2.jpg",
      "text": "Hemen alış-verişe başlayın"
    },
    {"image": "assets/images/welcome_3.jpg", "text": "#EvdeKal"}
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                      if (currentPage == splashData.length - 1) {
                        _visible = true;
                      } else {
                        _visible = false;
                      }
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]["image"],
                      text: splashData[index]["text"]))),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      )),
                  Spacer(
                    flex: 3,
                  ),
                  Visibility(
                    visible: _visible,
                    child: DefaultButton(
                      text: "Başla",
                      press: () {
                        Navigator.pushNamed(context, "/home");
                      },
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
