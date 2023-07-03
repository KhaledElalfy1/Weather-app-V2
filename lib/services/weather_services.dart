
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_v2/models/weather_model.dart';
class WeatherServices {
  String baseUrl='http://api.weatherapi.com/v1';
  String key ='0e12cff15da341a2b0e31146232206';
  Future<WeatherModel?> getCityName({required String cityName})
  async {
    WeatherModel? weather;
    try{
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$key&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(
          response.body); // to convert  json response  to way that in browser

      weather = WeatherModel.fromJison(data);
    }
    catch(e)
    {
      null;
    }

    return weather;
  }
}