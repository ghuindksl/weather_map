import 'dart:convert';

import 'package:weather_map/api/weathermodel.dart';
import 'package:http/http.dart' as http;


class Client {
  final String _apiKey = "eab51a6ef9553abf6fe9b0626b950ec5";
  final String _basicAddress = "api.openweathermap.org";
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lot) async {
    var url = Uri.http(
      _basicAddress,
      "/data/2.5/weather",
      {
        'lat': lat.toString(),
        'lon': lot.toString(),
        'appid': _apiKey,
      },
    );
    var response = await http.get(
      url
    );
    return CurrentWeatherModel.fromJson(jsonDecode(response.body));
  }
}
