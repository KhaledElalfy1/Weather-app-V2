import 'package:flutter/material.dart';

class WeatherModel
{
   DateTime date;
   String weatherStateName;
   String name;
   String icons;
   double temp;
   double maxTemp;
   double minTemp;

  WeatherModel(
      {required this.date,
        required this.weatherStateName,
        required this.name,
        required this.icons,
        required this.temp,
        required this.maxTemp,
        required  this.minTemp});

  factory WeatherModel.fromJison(dynamic data)
  {
    var jsonData=data['forecast']['forecastday'][0]['day'];
    return WeatherModel(date: DateTime.parse(data['location']['localtime']),
        weatherStateName: jsonData['condition']['text'],
        icons: jsonData['condition']['icon'],
        name: data['location']['name'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }

   MaterialColor getColor()
   {
     if(weatherStateName=='Clear'||weatherStateName=='Light Cloud')
     {
       return Colors.orange;
     }
     else if (weatherStateName=='Sleet'||weatherStateName=='Snow'||
         weatherStateName=='Hail')
     {
       return Colors.blue;
     }
     else if (weatherStateName=='Heavy Cloud')
     {
       return Colors.blueGrey;
     }
     else if (weatherStateName=='Light Rain'||weatherStateName=='Heavy Rain'||
         weatherStateName=='Showers' || weatherStateName== 'Patchy rain possible' )
     {
       return Colors.blue;
     }
     else if (weatherStateName=='Thunderstorm' ||weatherStateName== 'Thunder')
     {
       return Colors.blueGrey;
     }
     else
     {
       return Colors.orange;
     }

   }

}