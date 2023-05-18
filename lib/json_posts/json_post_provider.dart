import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PostJsonProvider extends ChangeNotifier
{
  List jsonlist = [];

  Future<void> getjsondata()
  async {
    String postsdata = await rootBundle.loadString("assets/json/posts.json");
    jsonlist = jsonDecode(postsdata);
    notifyListeners();

    print(jsonlist);
  }

}