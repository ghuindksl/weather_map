import 'package:json_annotation/json_annotation.dart';
part 'weathermodel.g.dart';

@JsonSerializable()
class CurrentWeatherModel{
  final WeatherModel weather;
  final CityModel name;
  final TemperatureModel main;

  CurrentWeatherModel(this.weather, this.name, this.main);
  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);
}

@JsonSerializable()
class WeatherModel{
  final String description;

  WeatherModel(this.description);
  factory WeatherModel.fromJson(Map<String, dynamic> json)=>_$WeatherModelFromJson(json);
}

@JsonSerializable()
class CityModel{
  final String name;

  CityModel(this.name);
  factory CityModel.fromJson(Map<String, dynamic> json)=>_$CityModelFromJson(json);
}

@JsonSerializable()
class TemperatureModel{
  final double temp ;
  final double temp_min;
  final double temp_max;

  TemperatureModel(this.temp, this.temp_min, this.temp_max);
  factory TemperatureModel.fromJson(Map<String, dynamic> json)=>_$TemperatureModelFromJson(json);
}