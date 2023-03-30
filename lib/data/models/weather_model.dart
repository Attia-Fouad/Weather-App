import 'package:weather_app1/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      super.id,
      super.main,
      super.description,
      super.temperature,
      super.feelsLike,
      super.miniTemperature,
      super.maxTemperature,
      super.pressure,
      super.windSpeed,
      super.cityName,
      super.cod);
  factory WeatherModel.fromJson(Map<String, dynamic>json)=>WeatherModel(
    json["id"],
    json["weather"][0]["main"],
    json["weather"][0]["description"],
    json["main"]["temp"],
    json["main"]["feels_like"],
    json["main"]["temp_min"],
    json["main"]["temp_max"],
    json["main"]["pressure"],
    json["wind"]["speed"],
    json["name"],
    json["cod"],


  );
}
