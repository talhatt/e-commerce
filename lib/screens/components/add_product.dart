import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_eticaret/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);
  static String routeName = "/addProduct";

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String ROOT = "http://localhost/EmployeesDB/upload.php";

  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imageFile;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _image == null
                  ? Container(
                      child: Text(
                      "Resim seçilmedi!",
                      style: TextStyle(fontSize: 30),
                    ))
                  : Image.file(_image),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Ürün Adı"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Ürün Açıklaması"),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Ürün Fiyatı"),
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: getImageGallery,
                    child: Icon(Icons.image),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        uploadImage(_image);
                      },
                      child: Text("Kaydet"),
                      color: kPrimaryColor,
                    ),
                  ),
                  RaisedButton(
                    onPressed: getImageCamera,
                    child: Icon(Icons.camera),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future uploadImage(File imageFile) async {
    //   var stream = http.ByteStream(Delegating).
    var length = await imageFile.length();
    var uri = Uri.parse(ROOT);

    var request = http.MultipartRequest("POST", uri);

    // var multipartFile = http.MultipartFile("image", stream, length,
    //   filename: basename(imageFile.path));
  }
}
