import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app_v2/cubit/weather_cubit.dart';


class SearchPage extends StatelessWidget {

  String? cityName;


  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (text)
              {
                cityName=text;
              },
              onSubmitted: (text) async {
                cityName=text;
                BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);

               Navigator.pop(context);

              },

              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 16),
                label: const Text('Search'),
                hintText: 'Enter a city',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);

                    Navigator.pop(context);
                  },
                    child: const Icon(Icons.search)
                ),

              ),

            ),
          ),
        ],
      ),

    );
  }
}

