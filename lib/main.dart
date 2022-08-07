import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/states/weather_cubit.dart';

void main() {
  runApp(
    BlocProvider(                                             //after use cubit in weather_cubit
      create: (context) => WeatherCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
      ),
      home: const Homepage(),
    );
  }
}
