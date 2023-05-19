import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'cartmodel.dart';

class CartProvider extends ChangeNotifier
{
  List<CartModel> cartlist = [];
  Future<void> fromJson()
  async {
    String json = await rootBundle.loadString("assets/json/cart.json");
    List cartdata = jsonDecode(json);

    cartlist = cartdata.map((e) => CartModel.fromJson(e)).toList();

    notifyListeners();
  }

}