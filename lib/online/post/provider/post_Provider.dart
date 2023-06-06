import 'package:flutter/foundation.dart';

import '../../../offline/json/json_cart/cartmodel.dart';
import '../api/post_API.dart';
import '../model/productmodel.dart';



class PostProvider extends ChangeNotifier
{

  String message = "";


  Future<String> post_data(name, price, offer, category, rate, description)
  async {
    return await Post_API.post_api.postDATAapi(name, price, offer, category, rate, description);
  }

  Future<List<ProModel>> datashow()
  async {
    return await Post_API.post_api.jsonshow();
  }

}




