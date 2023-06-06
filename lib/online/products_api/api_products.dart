import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:json_practice/online/products_api/products_model.dart';

class API_Products
{
 static API_Products api_products = API_Products();
  Future<List<ShoppingModel>> get_products_api()
  async {
    String productlink = "https://fakestoreapi.com/products";
    var url = Uri.parse(productlink);
    var response = await http.get(url);
    List jsondata= jsonDecode(response.body);

    List<ShoppingModel> productitems = jsondata.map((e) => ShoppingModel.fromJson(e)).toList();
    return productitems;
  }
}