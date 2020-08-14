import 'package:flutter/material.dart';
import 'package:mobile_eticaret/constants.dart' as CustomIcons;
import 'package:mobile_eticaret/screens/components/drawer.dart';

class Categories extends StatelessWidget {
  static String routeName = "/categories";
  GlobalKey<ScaffoldState> scaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      drawer: Drawer(child: DrawerBuilder()),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(CustomIcons.user),
            onPressed: () {
              scaffold.currentState.openDrawer();
            }),
        title: Center(child: Text("Kategoriler")),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, "/notification");
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              }),
        ],
      ),
    );
  }
}
