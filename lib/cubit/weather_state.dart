import '../models/weather_model.dart';

abstract class WeatherStates{}

class WeatherInital extends WeatherStates{}

class WeatherLoading extends WeatherStates{}

class WeatherFetch extends WeatherStates{
  WeatherModel weatherModel;
  WeatherFetch({required this.weatherModel});
}

class WeatherFailure extends WeatherStates{}
