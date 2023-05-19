import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_practice/json_people/model/peoplemodel.dart';

class PeopleProvider extends ChangeNotifier
{
  List<PeopleModel> peoples = [];

  Future<void> fromJson()
  async {
    String json = await rootBundle.loadString("assets/json/people.json");
    List peopledata = jsonDecode(json);
    peoples = peopledata.map((e) => PeopleModel.fromJson(e)).toList();
    notifyListeners();
  }


}