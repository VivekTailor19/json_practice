import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../offline/json/json_cart/cartmodel.dart';
import '../model/productmodel.dart';


class Post_API {

  static Post_API post_api = Post_API();

  Future<String> postDATAapi(
      String? name, String? price, String? offer, String? category, String? rate, String? description) async {
    String api_link =
        'https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php';
    var response = await http.post(Uri.parse(api_link), body: {
      "p_name": name,
      "p_price": price,
      "p_offer": offer,
      "p_category": category,
      "p_rate": rate,
      "p_desc": description
    });

    print(response.body);

    var json = jsonDecode(response.body);

    if (json[0]['status'] == 'ok') {
      return "Done";
    }
      return "Error";

  }

  Future<List<ProModel>> jsonshow() async {
    String showlink = "https://apidatahub.000webhostapp.com/MyShop/API/products.php";
    var response =await http.post(Uri.parse(showlink));

    List jsondata = jsonDecode(response.body);

    List<ProModel> list  = jsondata.map((e)=>ProModel.fromJson(e)).toList();
    return list;
  }

}
