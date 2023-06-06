import 'dart:convert';

import 'package:http/http.dart' as http;

import 'airline_model.dart';


class Airline_API
{
  static Airline_API airline_api = Airline_API();
  Future<AirBaseModel> get_JsonData()
  async {
    String airlineApi = "https://api.instantwebtools.net/v1/passenger?page=0&size=10";
    var url = Uri.parse(airlineApi);
    var response = await http.get(url);
    Map jsondata = jsonDecode(response.body);
AirBaseModel airBaseModel;
    return airBaseModel=AirBaseModel.fromJson(jsondata);
  }
}