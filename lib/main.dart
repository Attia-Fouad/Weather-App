import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:weather_app1/data/data_source/remote_data_source.dart';
import 'package:weather_app1/domain/base_repository/weather_base_repository.dart';
import 'package:weather_app1/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app1/presentation/screens/weather_screen.dart';

import 'data/repository/weather_repository.dart';
import 'domain/entities/weather.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const WeatherScreen(),
    );
  }
}