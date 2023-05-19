import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  List<Color> colors = [
    Colors.amber,
    Colors.green,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.cyan,
    Colors.teal,
    Colors.orange,
    Colors.deepOrange,
    Colors.yellow,
    Colors.deepPurple,
    Colors.blue,
    Colors.lime,
    Colors.white54,
    Colors.black,
    Colors.black12,
    Colors.lightBlue,
    Colors.amberAccent,
    Colors.tealAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.lightGreen,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.indigoAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.lightBlueAccent,
    Colors.orangeAccent,
    Colors.deepOrangeAccent
  ];
  int z=0;

  void generateRandomColor()
  {
    Random r = Random();
    z = r.nextInt(colors.length);
  }



}