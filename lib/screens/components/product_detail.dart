import 'package:flutter/material.dart';
import 'package:mobile_eticaret/constants.dart';
import 'package:mobile_eticaret/models/product.dart';
import 'package:mobile_eticaret/screens/components/custom_app_bar.dart';
import 'package:mobile_eticaret/screens/components/drawer.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  _ProductDetailState createState() => _ProductDetailState(product);
}

class _ProductDetailState extends State<ProductDetail> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final Product product;

  _ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      drawer: Drawer(child: DrawerBuilder()),
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            scaffold: scaffold,
            context: context,
            title: product.productName,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Hero(
                          tag: product.imageName,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image(
                              image: AssetImage(product.imageName),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.productName,
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "${product.price} TL",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
