import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_eticaret/constants.dart' as CustomIcons;
import 'package:mobile_eticaret/constants.dart';
import 'package:mobile_eticaret/size_config.dart';

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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.jpg"),
                  alignment: Alignment.topCenter),
            ),
            child: Container(
              child: Row(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(CustomIcons.user),
                      label: Text("Hesabım")),
                  Spacer(),
                  FlatButton.icon(
                    icon: Icon(CustomIcons.log_out),
                    label: Text("Giriş Yap"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/signIn");
                    },
                  ),
                ],
              ),
            ),
          ),
          AddToDrawerMenu(
            text: "Ana Sayfa",
            routeName: "/home",
            iconName: Icons.home,
          ),
          AddToDrawerMenu(
            text: "Kategoriler",
            routeName: "/categories",
            iconName: Icons.menu,
          ),
          Divider(),
          AddToDrawerMenu(text: "Çok Satanlar", iconName: Icons.star),
          AddToDrawerMenu(text: "Kampanyalar", iconName: CustomIcons.gift_icon),
          AddToDrawerMenu(
              text: "Süper Fırsatlar", iconName: CustomIcons.flash_icon),
          Divider(),
          AddToDrawerMenu(text: "Canlı Destek"),
          AddToDrawerMenu(text: "Geri Bildirim"),
          AddToDrawerMenu(text: "Yardım"),
        ],
      ),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        buildSpacer(),
        buildCarousel(),
        buildSpacer(),
        buildSliverToBoxAdapter(),
        buildSpacer(),
        buildSliverGrid(),
        buildSpacer(),
        buildSliverToBoxAdapter(),
        buildSpacer(),
        buildSliverList(),
        buildSpacer(),
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

  buildSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/specialDeals");
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                  child: Row(
                    children: <Widget>[
                      Text("Özel Fırsatlar",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shoesImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.0,
                        child: Card(
                          child: Image(
                            image: AssetImage(shoesImages[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Image(
              image: AssetImage(shoesImages[index]),
            )),
        childCount: 10,
      ),
    );
  }

  buildCarousel() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/topRatedProducts");
          },
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Popüler Ürünler",
                        style: TextStyle(
                            color: CustomIcons.kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlayCurve: Curves.easeInOutBack,
                    autoPlay: true,
                    height: getProportionateScreenHeight(250),
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                  ),
                  itemCount: shirtImages.length,
                  itemBuilder: (BuildContext context, int itemIndex) =>
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(shirtImages[itemIndex]),
                      ),
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

  buildSliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250.0,
        mainAxisSpacing: 5.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image(
              image: AssetImage(jacketImages[index]),
            ),
          );
        },
        childCount: jacketImages.length,
      ),
    );
  }

  buildSpacer() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 10.0,
      ),
    );
  }
}

class AddToDrawerMenu extends StatelessWidget {
  const AddToDrawerMenu({
    Key key,
    this.text,
    this.routeName,
    this.iconName,
  }) : super(key: key);
  final String text;
  final String routeName;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(text, style: TextStyle(fontWeight: FontWeight.w900)),
        leading: iconName == null ? null : Icon(iconName),
        onTap: routeName == null
            ? () {}
            : () {
                Navigator.pushNamed(context, routeName);
              });
  }
}
