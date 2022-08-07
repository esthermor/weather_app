
import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;                                      // import it as http

class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {       //the Future takes times to prepare the results
    const String apiKey = '45496ff689b901e8e16c41bd06589dba';
    final Uri url = Uri (
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units':'metric'},
    );
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather information.');
    }
  }
}
