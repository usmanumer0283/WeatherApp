import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_app/WeatherModel.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");

    if(result.statusCode != 200)
      throw Exception('Api Failed ');

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);
    //  final jsonWeather = jsonDecoded["main"] ;
    return WeatherModel.fromJson(jsonDecoded);
  }

}























/* Future<List<WeatherModel>> getWeather(String city) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2');
    if(response.statusCode != 200)
      throw Exception('Api Failed');
    var responseJson = json.decode(response.body);
    return (responseJson['main']['weather'] as List)
        .map((p) => WeatherModel.fromJson(p))
        .toList();
  }*/













