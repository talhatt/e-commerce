import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_eticaret/models/product.dart';

class DbHelper {
  static const _GET_ALL = 'http://10.0.2.2/EmployeesDB/read.php';
  static const _ADD_PRO = 'http://10.0.2.2/EmployeesDB/insert.php';
  static const _UPDATE_PRO = 'http://10.0.2.2/EmployeesDB/update.php';
  static const _DELETE_PRO = 'http://10.0.2.2/EmployeesDB/delete.php';
  static const _GET_ALL_BY_CATEGORY_NAME =
      'http://10.0.2.2/EmployeesDB/read.php?category_name=';

  //Method to create the table Employees.
  /*
  static Future<String> createTable() async {
    try {
      //add the paramaters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = "";
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }
*/

  // Method to get  products from Database...
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.post(_GET_ALL);
      //print("getResponse: ${response.body}");
      if (200 == response.statusCode) {
        List<Product> list = parseResponse(response.body);
        return list;
      } else {
        return List<Product>();
      }
    } catch (e) {
      print(e);
      return List<Product>(); // return an empyt list on exeption/error
    }
  }

  // Method to get  products by category_name from Database...
  static Future<List<Product>> getProductsByCategory(
      String categoryName) async {
    //Ana sayfa açılırken animasyon gösterimi için
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final response =
          await http.post("${_GET_ALL_BY_CATEGORY_NAME}${categoryName}");
      //print("getResponse: ${response.body}");
      if (200 == response.statusCode) {
        List<Product> list = parseResponse(response.body);
        return list;
      } else {
        return List<Product>();
      }
    } catch (e) {
      print(e);
      return List<Product>(); // return an empyt list on exeption/error
    }
  }

  static List<Product> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  // Method to add a product in Database...
  static Future<String> addProduct(Map map) async {
    try {
      final response = await http.post(_ADD_PRO, body: map);
      //print("addProduct Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  // Method to update a product in Database...
  static Future<String> updateProduct(Map map) async {
    try {
      final response = await http.post(_UPDATE_PRO, body: map);
      //print("updateProduct Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  // Method to delete a product from Database...
  static Future<String> deleteProduct(
    int id,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map['id'] = id;
      final response = await http.post(_DELETE_PRO, body: map);
      //print("deleteProduct Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }
}
