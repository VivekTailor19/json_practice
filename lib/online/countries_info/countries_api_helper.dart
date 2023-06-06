import 'dart:convert';

import 'package:http/http.dart' as http;

import 'countries_model.dart';


class Countries_API
{
  static Countries_API countries_api = Countries_API();
  Future<List<CountriesModel>> api_countriesData_get()
  async {
    String countryapi = "https://restcountries.com/v3.1/all";
    var url = Uri.parse(countryapi);
    var response = await http.get(url);

    List jsondata = jsonDecode(response.body);
    List<CountriesModel> countries = jsondata.map((e) => CountriesModel.fromJson(e)).toList();

    return countries;
  }
}