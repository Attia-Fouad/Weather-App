class Weather{
  late int id;
  late String main;
  late String description;
  late double temperature;
  late double feelsLike;
  late double miniTemperature;
  late double maxTemperature;
  late int pressure;
  late double windSpeed;
  late String cityName;
  late int cod;

  Weather(
      this.id,
      this.main,
      this.description,
      this.temperature,
      this.feelsLike,
      this.miniTemperature,
      this.maxTemperature,
      this.pressure,
      this.windSpeed,
      this.cityName,
      this.cod
      );
}