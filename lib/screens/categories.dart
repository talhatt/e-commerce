import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  static String routeName = "/categories";

  @override
  Widget build(BuildContext context) {
    return Column();
  }

  Column buildColumn() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    TabBar(tabs: [
                      Icon(Icons.ac_unit),
                    ])
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Container(
              height: 750,
              width: 350,
              child: Icon(Icons.access_alarm),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
