

import 'package:flutter/material.dart';


import 'countries_api_helper.dart';
import 'countries_model.dart';

class CountriesProvider extends ChangeNotifier
{
  Future<List<CountriesModel>> load_Datas()
  async {
    return await Countries_API.countries_api.api_countriesData_get();
    notifyListeners();
  }


}