import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_v2/cubit/weather_cubit.dart';
import 'package:weather_app_v2/cubit/weather_state.dart';

import 'package:weather_app_v2/screens/search_page.dart';
import 'package:weather_app_v2/screens/statup_page.dart';
import 'package:weather_app_v2/screens/weather_screen_v2.dart';

import '../models/weather_model.dart';
import '../providers/provider_model.dart';



class HomePage extends StatelessWidget {

WeatherModel?weatherData;

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
              return SearchPage();
            },));
          }, icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App',),
      ),

      body: BlocBuilder<WeatherCubit,WeatherStates>(builder: (context, state) {
        if(state is WeatherLoading)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
        else if(state is WeatherInital)
          {
            return const IntialScreen() ;
          }
        else if(state is WeatherFetch)
          {
            return  WeatherScreenV2(weatherData: state.weatherModel,);
          }
        else
        {
          return const Center(child: Text('Something went wrong please try again'),);
        }

      },
      ),


    );
  }
}


