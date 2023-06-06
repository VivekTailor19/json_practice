import 'dart:convert';

import 'package:http/http.dart' as http;

class D_Products_API
{
  Map jsondata = {};

  Future<Map> calling_Product_API()
  async {
    String? product_API = "https://dummyjson.com/products";

    var url = Uri.parse(product_API);
    var response = await http.get(url);

    jsondata = jsonDecode(response.body);
    return jsondata;

  }
}