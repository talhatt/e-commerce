import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const List<String> shoesImages = <String>[
  'assets/images/shoes/1.jpg',
  'assets/images/shoes/2.jpg',
  'assets/images/shoes/3.jpg',
  'assets/images/shoes/4.jpg',
  'assets/images/shoes/5.jpg',
  'assets/images/shoes/6.jpg',
  'assets/images/shoes/7.jpg',
  'assets/images/shoes/8.jpg',
  'assets/images/shoes/9.jpg',
  'assets/images/shoes/10.jpg',
  'assets/images/shoes/11.jpg',
  'assets/images/shoes/12.jpg',
  'assets/images/shoes/13.jpg',
];
const List<String> shirtImages = <String>[
  'assets/images/shirts/1.jpg',
  'assets/images/shirts/2.jpg',
  'assets/images/shirts/3.jpg',
  'assets/images/shirts/4.jpg',
  'assets/images/shirts/5.jpg',
  'assets/images/shirts/6.jpg',
  'assets/images/shirts/7.jpg',
  'assets/images/shirts/8.jpg',
];
const List<String> pantImages = <String>[
  'assets/images/pants/1.jpg',
  'assets/images/pants/2.jpg',
  'assets/images/pants/3.jpg',
  'assets/images/pants/4.jpg',
  'assets/images/pants/5.jpg',
  'assets/images/pants/6.jpg',
];
const List<String> jacketImages = <String>[
  'assets/images/jackets/1.jpg',
  'assets/images/jackets/2.jpg',
  'assets/images/jackets/3.jpg',
  'assets/images/jackets/4.jpg',
  'assets/images/jackets/5.jpg',
  'assets/images/jackets/6.jpg',
  'assets/images/jackets/7.jpg',
  'assets/images/jackets/8.jpg',
  'assets/images/jackets/9.jpg',
  'assets/images/jackets/10.jpg',
];

const _kFontFam = 'MyFlutterApp';
const _kFontPkg = null;

const IconData plus_icon =
    IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData question_mark =
    IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData receipt =
    IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData remove =
    IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData search_icon =
    IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData settings =
    IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData shop_icon =
    IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData star_icon =
    IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData success =
    IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData trash =
    IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData twitter =
    IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData user_icon =
    IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData user =
    IconData(0xe80c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData arrow_right =
    IconData(0xe80d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData back_icon =
    IconData(0xe80e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData bell =
    IconData(0xe80f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData bill_icon =
    IconData(0xe810, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData call =
    IconData(0xe811, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData camera_icon =
    IconData(0xe812, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData cart_icon =
    IconData(0xe813, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData cash =
    IconData(0xe814, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData chat_bubble_icon =
    IconData(0xe815, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData check_mark_rounde =
    IconData(0xe816, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData close =
    IconData(0xe817, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData conversation =
    IconData(0xe818, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData discover =
    IconData(0xe819, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData error =
    IconData(0xe81a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData facebook_2 =
    IconData(0xe81b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData flash_icon =
    IconData(0xe81c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData game_icon =
    IconData(0xe81d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData gift_icon =
    IconData(0xe81e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData google_icon =
    IconData(0xe81f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData heart_icon =
    IconData(0xe820, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData heart_icon_2 =
    IconData(0xe821, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData location_point =
    IconData(0xe822, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData lock =
    IconData(0xe823, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData log_out =
    IconData(0xe824, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData mail =
    IconData(0xe825, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData parcel =
    IconData(0xe826, fontFamily: _kFontFam, fontPackage: _kFontPkg);
const IconData phone =
    IconData(0xe827, fontFamily: _kFontFam, fontPackage: _kFontPkg);
