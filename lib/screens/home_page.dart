import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app_v2/screens/search_page.dart';
import 'package:weather_app_v2/screens/weather_screen_v1.dart';
import 'package:weather_app_v2/screens/weather_screen_v2.dart';

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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("There's no weather 😔 start",
              style: TextStyle(
                fontSize: 25,
              ),

            ),
            Text('Search Now 🔍',
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
      ),
        )
          :

         const WeatherScreenV2(),
    );
  }
}
