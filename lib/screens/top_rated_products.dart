import 'package:flutter/material.dart';

class TopRatedProducts extends StatefulWidget {
  static String routeName = "/topRatedProducts";
  @override
  _TopRatedProductsState createState() => _TopRatedProductsState();
}

class _TopRatedProductsState extends State<TopRatedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Popüler Ürünler")),
    );
  }
}
