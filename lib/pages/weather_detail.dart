import 'package:flutter/material.dart';
import 'package:weather_app/states/weather_state.dart';
import 'package:weather_app/widgets/weather_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/weather_cubit.dart';


class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.cityName, Key? key}) : super(key: key);

  final String cityName;    //create var cityName

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
    ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Detail'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Center(
            child: BlocBuilder<WeatherCubit, WeatherState>(
              bloc: cubit,
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const CircularProgressIndicator();    //the circle loading thing
                    }
                    if (state is WeatherLoaded) {
                      return WeatherInformation(weatherModel: state.weatherModel);
                    }
                    return Text(state is WeatherError ? state.errorMessage
                        : '');
                  }
                ),
          ),)
        ],
      ),
    );
  }
}
