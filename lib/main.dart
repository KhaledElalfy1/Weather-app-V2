import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v2/cubit/weather_cubit.dart';
import 'package:weather_app_v2/screens/home_page.dart';
import 'package:weather_app_v2/services/weather_services.dart';

void main() {
  runApp(  BlocProvider(

    create: (context){
      return WeatherCubit(WeatherServices());
    },
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel== null ? Colors.blue
            :
        BlocProvider.of<WeatherCubit>(context).weatherModel!.getColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
