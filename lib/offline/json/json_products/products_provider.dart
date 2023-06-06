import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_practice/offline/json/json_products/products_model.dart';





class P_Provider extends ChangeNotifier
{

  P_model? p_Model;

  Future<void> useJson()
  async {
    String json = await rootBundle.loadString("assets/json/products.json");

    // print("Json");
    // print(json);

    var products = jsonDecode(json);
    //
    // print("\n\nProducts");
    // print(products);

    p_Model = P_model.fromJson(products);

    // productsModel = products.map((e) => ProductsModel.fromJson(e)) as Map;
    notifyListeners();
  }

}