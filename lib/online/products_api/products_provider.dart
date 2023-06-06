
import 'package:flutter/cupertino.dart';
import 'package:json_practice/online/products_api/products_model.dart';

import 'api_products.dart';

class ShoppingProvider extends ChangeNotifier
{

  Future<List<ShoppingModel>> call_api()
  async {
    return await API_Products.api_products.get_products_api();
    notifyListeners();

  }

  List<ShoppingModel> items = [];


}