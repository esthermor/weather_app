import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {

  const WeatherInformation({
    required this.weatherModel,
  Key? key}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://openweathermap.org/img/wn/${weatherModel.weather.first.icon}.png', scale: 0.4),

            const SizedBox(height: 10,),
            Text('${weatherModel.main.temp} \u00B0C', style: TextStyle(fontSize: 35),),

            const SizedBox(height: 10,),
            Text('${weatherModel.name}',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),

            const SizedBox(height: 10,),
            Text('${weatherModel.weather.first.description}',style: TextStyle(fontWeight: FontWeight.bold),),

            const SizedBox(height: 10,),
            Text('Lowest Temp: ${weatherModel.main.tempMin} \u00B0C', style: TextStyle(fontSize: 15),),

            const SizedBox(height: 10,),
            Text('Highest Temp: ${weatherModel.main.tempMax} \u00B0C', style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

