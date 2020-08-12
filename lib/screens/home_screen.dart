import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_eticaret/constants.dart' as CustomIcons;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: buildCustomScrollView(),
      drawer: buildDrawer(context),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Row(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(CustomIcons.user),
                      label: Text("Hesabım")),
                  Spacer(),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(CustomIcons.log_out),
                      label: Text("Giriş Yap")),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Ana Sayfa"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
          ListTile(
            title: Text("Kategoriler"),
            leading: Icon(Icons.menu),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Çok Satanlar"),
            leading: Icon(Icons.star),
            onTap: () {},
          ),
          ListTile(
            title: Text("Kampanyalar"),
            leading: Icon(CustomIcons.gift_icon),
            onTap: () {},
          ),
          ListTile(
            title: Text("Süper Fırsatlar"),
            leading: Icon(CustomIcons.flash_icon),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Canlı Destek"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Geri Bildirim"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Yardım"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
      ],
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
          icon: Icon(CustomIcons.user),
          onPressed: () {
            scaffold.currentState.openDrawer();
          }),
      title: Center(child: Text("LogDef")),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
      ],
      expandedHeight: 125,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
