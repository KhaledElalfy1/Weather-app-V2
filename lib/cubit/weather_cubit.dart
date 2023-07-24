import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubit/weather_state.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherServices) : super(WeatherInital());
  WeatherServices weatherServices;
  WeatherModel? weatherModel;
  void getWeather({required String cityName})async{
    emit(WeatherLoading());
    try {
      weatherModel=await weatherServices.getCityName(cityName: cityName!);
      emit(WeatherFetch(weatherModel: weatherModel!));
    } on Exception catch (e) {
     emit(WeatherFailure());
    }

  }

}