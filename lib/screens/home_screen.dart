import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_eticaret/constants.dart' as CustomIcons;
import 'package:mobile_eticaret/constants.dart';
import 'package:mobile_eticaret/models/product.dart';
import 'package:mobile_eticaret/screens/components/custom_app_bar.dart';
import 'package:mobile_eticaret/screens/components/drawer.dart';
import 'package:mobile_eticaret/screens/components/product_detail.dart';
import 'package:mobile_eticaret/services/db_service.dart';
import 'package:mobile_eticaret/size_config.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  String objectName;
  List<Product> products;

  _getProductsByCategory() {
    DbHelper.getProductsByCategory("jackets").then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  void initState() {
    products = [];
    _getProductsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: buildCustomScrollView(),
      drawer: Drawer(child: DrawerBuilder()),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        CustomSliverAppBar(
          scaffold: scaffold,
          context: context,
          title: "LogDef",
        ),
        buildSpacer(),
        CustomCarousel(
          products: products,
          title: "Popüler Ürünler",
          routeName: "/topRatedProducts",
        ),
        buildSpacer(),
        CustomSliverToBoxAdapter(
          products: products,
          routeName: "/specialDeals",
          title: "Özel Fırsatlar",
        ),
        buildSpacer(),
        CustomSliverGrid(products: products),
        buildSpacer(),
        CustomSliverToBoxAdapter(
          products: products,
          routeName: "/specialDeals",
          title: "%20 İndirimli Ürünler",
        ),
        buildSpacer(),
        CustomSliverList(
          products: products,
        ),
        buildSpacer(),
      ],
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

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({
    Key key,
    this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: products.length == 0
                ? CircularProgressIndicator()
                : Image.network(products[index].imageName)),
        childCount: products.length,
      ),
    );
  }
}

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    Key key,
    @required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250.0,
        childAspectRatio: 1 / 1.70,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: products[index].imageName,
                      child: products.length == 0
                          ? CircularProgressIndicator()
                          : Image.network(products[index].imageName),
                    ),
                    Text(products[index].productName),
                    Text("${products[index].price} TL"),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetail(product: products[index]),
                        ));
                  },
                ),
              ),
            ],
          );
        },
        childCount: products.length,
      ),
    );
  }
}

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    Key key,
    @required this.products,
    @required this.title,
    @required this.routeName,
  }) : super(key: key);

  final List<Product> products;
  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
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
                        title,
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
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int itemIndex) =>
                      Container(
                    child: products.length == 0
                        ? CircularProgressIndicator()
                        : Image.network(products[itemIndex].imageName),
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

class CustomSliverToBoxAdapter extends StatelessWidget {
  const CustomSliverToBoxAdapter({
    Key key,
    @required this.products,
    @required this.routeName,
    @required this.title,
  }) : super(key: key);

  final List<Product> products;
  final String routeName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
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
                      Text(title,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 180.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100.0,
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: products.length == 0
                                  ? CircularProgressIndicator()
                                  : Image.network(products[index].imageName),
                            ),
                            Text(products[index].productName),
                          ],
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
}
