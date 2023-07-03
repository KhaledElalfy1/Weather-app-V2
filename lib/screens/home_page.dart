import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app_v2/screens/search_page.dart';

import '../models/weather_model.dart';
import '../providers/provider_model.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

WeatherModel?weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<ProviderModel>(context).weatherData;
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
      body:weatherData ==null ?
        const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There's no weather 😔 start",
            style: TextStyle(
              fontSize: 30,
            ),

          ),
          Text('Search Now 🔍',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      )
          :

        Container(
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
                // Image.asset('assets/images/clear.png'),
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
      ),
    );
  }
}
