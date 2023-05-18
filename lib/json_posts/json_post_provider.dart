import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PostJsonProvider extends ChangeNotifier
{
  List jsonlist = [];

  Future<void> getjsondata()
  async {
    String jsondata = await rootBundle.loadString("assets/json/posts.json");
    jsonlist = jsonDecode(jsondata);
    notifyListeners();

    print(jsonlist);
  }

}