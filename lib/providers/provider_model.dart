import 'package:flutter/cupertino.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class ProviderModel extends ChangeNotifier {
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather)
  {
    _weatherData= weather;
    notifyListeners(); // TODO : make UI updated
  }

  WeatherModel? get weatherData => _weatherData;

}