import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Row(
                  children: <Widget>[
                    FlatButton(onPressed: () {}, child: Text("Hesabım")),
                    Spacer(),
                    FlatButton(
                      onPressed: () {},
                      child: Text("Giriş Yap"),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Merhaba"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(onPressed: () {})
          ],
        ),
      ),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        buildSliverList(),
      ],
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text("Item $index"),
        ),
        childCount: 100,
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            scaffold.currentState.openDrawer();
          }),
      title: Center(child: Text("Mobil e-ticaret")),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
      ],
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
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
    );
  }
}
