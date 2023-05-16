import 'package:weather_app1/domain/base_repository/weather_base_repository.dart';

import '../entities/weather.dart';

class GetWeatherByLatLon {
  final BaseWeatherRepository repository;

  GetWeatherByLatLon(this.repository);
  Future<Weather> execute(dynamic lat,dynamic long,String language)async{
    return await repository.getWeatherByLatLong(lat, long, language);

  }
}