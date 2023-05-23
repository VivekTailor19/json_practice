import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_practice/json/json_products/products_model.dart';

class ProductsProvider extends ChangeNotifier
{

  ProductsModel? productsModel;
  Future<void> json_to_use()
  async {
    String json = await rootBundle.loadString("assets/json/products.json");

    // print("Json");
    // print(json);

    var products = jsonDecode(json);
    //
    // print("\n\nProducts");
    // print(products);

    productsModel = ProductsModel.fromJson(products);

    // productsModel = products.map((e) => ProductsModel.fromJson(e)) as Map;
    notifyListeners();
  }

}