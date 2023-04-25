import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app1/presentation/controller/cubit/cubit.dart';
import 'package:weather_app1/presentation/controller/cubit/states.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatelessWidget {
  final String temperature = '20';
  final String weatherCondition = 'cloudy';

  const WeatherScreen({Key? key}) : super(key: key);

  Future<void> refresh(BuildContext context) async {
    return BlocProvider.of<AppCubit>(context).getCurrentLocation();
    //return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCurrentLocation(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () => refresh(context),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4A148C),
                          Color(0xFF880E4F),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  (cubit.weather != null && states is! GetWeatherLoadingState)
                      ? Center(
                          child: ListView(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  const Text(
                                    'City Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    cubit.weather!.cityName.toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  const Text(
                                    'Today',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    DateFormat('EEEE, MMM d, yyyy')
                                        .format(DateTime.now())
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    DateFormat.jm()
                                        .format(DateTime.now())
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  const SizedBox(height: 40.0),
                                  const Icon(
                                    WeatherIcons.day_sunny,
                                    size: 100.0,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 40.0),
                                  Text(
                                    '${(cubit.weather!.temperature - 273.15).roundToDouble()}°C',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '${(cubit.weather!.miniTemperature - 273.15).roundToDouble()}° / ${(cubit.weather!.maxTemperature - 273.15).roundToDouble()}°',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Feels like ${(cubit.weather!.feelsLike - 273.15).roundToDouble()}°',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Pressure ${cubit.weather?.pressure} mb',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    '${cubit.weather?.description}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(height: 50.0),
                                  const Icon(
                                    WeatherIcons.wind_beaufort_0,
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Wind speed : ${cubit.weather?.windSpeed}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  SizedBox(
                                    width: 56.0,
                                    height: 56.0,
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        await cubit.getCurrentLocation();
                                      },
                                      backgroundColor: Colors.blueGrey[900],
                                      elevation: 8.0,
                                      highlightElevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color: Colors.blueGrey[900]!,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: const Icon(Icons.refresh,
                                      color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),

                                ],
                              ),
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
