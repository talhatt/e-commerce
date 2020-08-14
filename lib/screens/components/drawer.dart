import 'package:flutter/material.dart';
import 'package:mobile_eticaret/constants.dart' as CustomIcons;
import 'package:mobile_eticaret/screens/components/add_to_drawer_menu.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
