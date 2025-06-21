import 'dart:convert'; // for json.decode
import 'package:http/http.dart' as http;
import 'package:shopxget/features/homepage/model/productmodel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<ProductDetailsModel?> fetchProducts() async {
    final response = await client.get(Uri.parse('https://dummyjson.com/products?limit=20&select=title,price,description,images'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return ProductDetailsModel.fromJson(jsonMap);
    } else {
      // Handle error, maybe throw an exception or return null
      return null;
    }
  }
}