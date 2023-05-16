import 'package:weather_app1/domain/entities/weather.dart';

abstract class BaseWeatherRepository{
Future<Weather> getWeatherByLatLong(dynamic lat, dynamic long,String language);

}