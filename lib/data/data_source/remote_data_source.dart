import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app1/core/utils/constance.dart';
import 'package:weather_app1/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel?>getWeatherByLatLong(dynamic lat,dynamic long,String language);

}
int? id;
int? ide;
// just for test git
class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByLatLong(dynamic lat, dynamic long, String language) async{
    var response = await Dio()
        .get('${AppConstance.baseUrl}/weather?lat=${lat.toString()}&lon=${long.toString()}&appid=${AppConstance.appKey}');
    if (kDebugMode) {
      print(response);
    }
    return  WeatherModel.fromJson(response.data);

  }


}