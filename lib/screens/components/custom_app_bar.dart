import 'package:flutter/material.dart';
import 'package:mobile_eticaret/constants.dart' as CustomIcons;

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
    @required this.context,
    @required this.title,
    @required this.scaffold,
  }) : super(key: key);

  final BuildContext context;
  final String title;
  final GlobalKey<ScaffoldState> scaffold;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          icon: Icon(CustomIcons.user),
          onPressed: () {
            scaffold.currentState.openDrawer();
          }),
      title: Center(child: Text(title)),
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
      expandedHeight: 125,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
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
                        hintText: "Ürün Ara",
                        enabledBorder: InputBorder.none,
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
