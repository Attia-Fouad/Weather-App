import 'package:weather_app1/domain/entities/weather.dart';

abstract class BaseWeatherRepository{
Future<Weather> getWeatherByLatLong(double lat, double long,String language);

}