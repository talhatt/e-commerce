import 'package:flutter/material.dart';
import 'package:mobile_eticaret/models/product.dart';
import 'package:mobile_eticaret/services/db_service.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products;

  @override
  void initState() {
    products = [];
    _getProductsIncart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepetiniz"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Image.network(products[index].imageName)),
              );
            },
          ),
        ),
      ),
    );
  }

  void _getProductsIncart() {
    DbHelper.getProductsByIncart().then((value) {
      setState(() {
        products = value;
      });
    });
  }
}
