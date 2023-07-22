// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      WeatherModel.fromJson(json['weather'] as Map<String, dynamic>),
      CityModel.fromJson(json['name'] as Map<String, dynamic>),
      TemperatureModel.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
        CurrentWeatherModel instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'name': instance.name,
      'main': instance.main,
    };

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      json['description'] as String,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'description': instance.description,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      json['name'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
    };

TemperatureModel _$TemperatureModelFromJson(Map<String, dynamic> json) =>
    TemperatureModel(
      (json['temp'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureModelToJson(TemperatureModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
    };
