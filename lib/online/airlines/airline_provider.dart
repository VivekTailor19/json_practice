

import 'package:flutter/cupertino.dart';


import 'airline_api_helper.dart';
import 'airline_model.dart';

class AirlineProvider extends ChangeNotifier
{


  Future<AirBaseModel> futuredatas()
  async {
    return await Airline_API.airline_api.get_JsonData();
    notifyListeners();
  }

}