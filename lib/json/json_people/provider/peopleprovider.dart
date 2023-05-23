import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/peoplemodel.dart';


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


  List<String> images = [
    "assets/images/person (1).png",
    "assets/images/person (2).png",
    "assets/images/person (3).png",
    "assets/images/person (4).png",
    "assets/images/person (5).png",
    "assets/images/person (6).png",
    "assets/images/person (7).png",
    "assets/images/person (8).png",
    "assets/images/person (9).png",
    "assets/images/person (10).jpg",
  ];

  int imageindex = 0;
  void generateimage()
  {
    Random r = Random();
    imageindex = r.nextInt(10);

  }


}