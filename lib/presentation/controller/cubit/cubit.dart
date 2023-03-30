import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app1/domain/entities/weather.dart';
import 'package:weather_app1/presentation/controller/cubit/states.dart';

import '../../../data/data_source/remote_data_source.dart';
import '../../../data/repository/weather_repository.dart';
import '../../../domain/base_repository/weather_base_repository.dart';
import '../../../domain/usecases/get_weather_usecase.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  Future<void> getCurrentLocation()async {
    Location location = Location();
    LocationData locationData;
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        SystemNavigator.pop();
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        //return;
        SystemNavigator.pop();
      }
    }

    locationData = await location.getLocation();
    await getWeatherData(locationData.latitude!, locationData.longitude!, 'en');
  }

  Weather? weather;
  Future<void> getWeatherData(double lat, double long,String language)
  async {
    emit(GetWeatherLoadingState());
    BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();
    BaseWeatherRepository baseWeatherRepository=WeatherRepository(baseRemoteDataSource);
    weather=await GetWeatherByLatLon(baseWeatherRepository).execute(lat, long, 'en');
    emit(GetWeatherSuccessState());
  }

}
