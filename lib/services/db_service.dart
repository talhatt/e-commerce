import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_eticaret/models/product.dart';

class DbHelper {
  static const _GET_ALL_ACTION = 'http://localhost/EmployeesDB/read.php';
  static const _ADD_PRO_ACTION = 'http://localhost/EmployeesDB/insert.php';
  static const _UPDATE_PRO_ACTION = 'http://localhost/EmployeesDB/update.php';
  static const _DELETE_PRO_ACTION = 'http://localhost/EmployeesDB/delete.php';

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
      return "error";
    }
  }
*/

  // Method to get  products from Database...
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.post(_GET_ALL_ACTION);
      print("getResponse: ${response.body}");
      if (200 == response.statusCode) {
        List<Product> list = parseResponse(response.body);
        return list;
      } else {
        return List<Product>();
      }
    } catch (e) {
      return List<Product>(); // return an empyt list on exeption/error
    }
  }

//TODO: HOW TO DECODE FRoM JSON
  static List<Product> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  // Method to add a product in Database...
  static Future<String> addProduct(Map map) async {
    try {
      final response = await http.post(_ADD_PRO_ACTION, body: map);
      print("addProduct Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update a product in Database...
  static Future<String> updateProduct(Map map) async {
    try {
      final response = await http.post(_UPDATE_PRO_ACTION, body: map);
      print("updateProduct Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
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
      final response = await http.post(_DELETE_PRO_ACTION, body: map);
      print("deleteProduct Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
