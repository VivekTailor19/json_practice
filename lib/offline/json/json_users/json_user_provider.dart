import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class UserJsonProvider extends ChangeNotifier
{
  List userlist = [];

  Future<void> getuserjson()
  async {
    String usersdata = await rootBundle.loadString("assets/json/users.json");
    userlist = jsonDecode(usersdata);
    notifyListeners();
  }
}