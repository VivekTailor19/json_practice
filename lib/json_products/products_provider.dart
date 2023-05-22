import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_practice/json_products/products_model.dart';

class ProductsProvider extends ChangeNotifier
{
  List prodctslist = [];
  Future<void> setjson()
  async {
    String? json = await rootBundle.loadString("assets/json/products.json");
    List jsondata = jsonDecode(json);

    prodctslist = jsondata.map((e) => ProductsModel.fromJson(e)).toList();
    notifyListeners();
  }

}