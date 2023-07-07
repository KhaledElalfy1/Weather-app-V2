import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/services/weather_services.dart';

import '../providers/provider_model.dart';

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
                WeatherServices weather = WeatherServices();
               WeatherModel? weatherModel =await weather.getCityName(cityName: cityName!);
               Provider.of<ProviderModel>(context,listen: false).weatherData=weatherModel;
               print(Provider.of<ProviderModel>(context,listen: false).weatherData);

               Navigator.pop(context);

              },

              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 16),
                label: const Text('Search'),
                hintText: 'Enter a city',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherServices weather = WeatherServices();
                    WeatherModel? weatherModel =await weather.getCityName(cityName: cityName!);
                    Provider.of<ProviderModel>(context,listen: false).weatherData=weatherModel;

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

