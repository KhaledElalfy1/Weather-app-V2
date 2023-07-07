import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/provider_model.dart';


class WeatherScreenV1 extends StatefulWidget {
  const WeatherScreenV1({super.key});

  @override
  State<WeatherScreenV1> createState() => _WeatherScreenV1State();
}

class _WeatherScreenV1State extends State<WeatherScreenV1> {
  WeatherModel?weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<ProviderModel>(context).weatherData;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                weatherData!.getColor()[500]!,
                weatherData!.getColor()[400]!,
                weatherData!.getColor()[200]!,

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      child: Column(
        children: [
          const Spacer(flex: 3),
          Text(weatherData!.name,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("lat update ${weatherData!.date.hour}:${weatherData!.date.minute}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weatherData!.icons}',
                height: 100,
                width: 100,
              ),
              Text(weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('MaxTemp: ${weatherData!.maxTemp.toInt()}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text('MinTemp: ${weatherData!.minTemp.toInt()}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),


            ],
          ),
          const Spacer(),
          Text(weatherData!.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(flex: 5,)

        ],
      ),
    );
  }
}
