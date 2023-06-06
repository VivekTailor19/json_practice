
import 'package:flutter/foundation.dart';


import 'd_products_api_helper.dart';
import 'd_products_model.dart';

class D_ProductsProvider extends ChangeNotifier
{

  D_ProductsModel? d_products;

  Future<void> catchjson_n_loadit()
  async {
    D_Products_API d_products_api = D_Products_API();
    Map tempjson = await d_products_api.calling_Product_API();
    d_products = D_ProductsModel.fromJson(tempjson);

    notifyListeners();
  }

}