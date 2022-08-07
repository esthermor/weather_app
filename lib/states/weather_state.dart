// use to fetch data from weather
// first state : initializing
// second state : loading
// third state : loaded
// forth state : error

import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState{}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError({required this.errorMessage});
}