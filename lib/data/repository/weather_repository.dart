import 'package:weather_app1/data/data_source/remote_data_source.dart';
import 'package:weather_app1/domain/entities/weather.dart';

import '../../domain/base_repository/weather_base_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDataSource;
  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByLatLong(dynamic lat, dynamic long, String language) async{
    return (await baseRemoteDataSource.getWeatherByLatLong(lat, long, language))!;
  }

}