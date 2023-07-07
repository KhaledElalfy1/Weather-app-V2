import 'package:flutter/material.dart';
DateTime now = DateTime.now();
int houre1=(now.hour+1)%24;
int houre2=(now.hour+2)%24;
int houre3=(now.hour+3)%24;
int houre4=(now.hour+4)%24;
class WeatherModel
{
   DateTime date;
   String weatherStateName;
   String name; //city name
   String icons;
   double temp;
   double maxTemp;
   double minTemp;
   double windSpeed;
   int rainRate;
////////////
  double tempHour1;
  double tempHour2;
  double tempHour3;
  double tempHour4;
  String iconHour1;
  String iconHour2;
  String iconHour3;
  String iconHour4;
  //////////////////
  DateTime scenodDayDate;
  String secondDayIcon;
  double secondDayMaxTemp;
  double secondDayMinTemp;

  DateTime thirdDayDate;
  String thirdDayIcon;
  double thirdDayMaxTemp;
  double thirdDayMinTemp;







  WeatherModel(
      {required this.date,
        required this.weatherStateName,
        required this.name,
        required this.icons,
        required this.temp,
        required this.maxTemp,
        required  this.minTemp,
        required this.windSpeed,
        required this.rainRate,
        required this.tempHour1,
        required this.tempHour2,
        required this.tempHour3,
        required this.tempHour4,
        required this.iconHour1,
        required this.iconHour2,
        required this.iconHour3,
        required this.iconHour4,
        required this.scenodDayDate,
        required this.secondDayIcon,
        required this.secondDayMaxTemp,
        required this.secondDayMinTemp,
        required this.thirdDayDate,
        required this.thirdDayIcon,
        required this.thirdDayMaxTemp,
        required this.thirdDayMinTemp,



      });

  factory WeatherModel.fromJison(dynamic data)
  {
    var jsonData=data['forecast']['forecastday'][0]['day'];
    var hoursTemp=data['forecast']['forecastday'][0]['hour'];
    var jsonData2=data['forecast']['forecastday'][1]['day'];
    var jsonData3=data['forecast']['forecastday'][2]['day'];
    return WeatherModel(date: DateTime.parse(data['location']['localtime']),
        weatherStateName: jsonData['condition']['text'],
        icons: jsonData['condition']['icon'],
        name: data['location']['name'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        windSpeed: jsonData['maxwind_kph'],
    rainRate: jsonData['daily_will_it_rain'],

      tempHour1: hoursTemp[houre1]['temp_c'],
      tempHour2: hoursTemp[houre2]['temp_c'],
      tempHour3: hoursTemp[houre3]['temp_c'],
      tempHour4: hoursTemp[houre4]['temp_c'],
      iconHour1: hoursTemp[houre1]['condition']['icon'],
      iconHour2: hoursTemp[houre2]['condition']['icon'],
      iconHour3: hoursTemp[houre3]['condition']['icon'],
      iconHour4: hoursTemp[houre4]['condition']['icon'],

      scenodDayDate: DateTime.parse(data['forecast']['forecastday'][1]['date']),
      secondDayIcon: jsonData2['condition']['icon'],
      secondDayMaxTemp: jsonData2['maxtemp_c'],
      secondDayMinTemp: jsonData2['mintemp_c'],

      thirdDayDate: DateTime.parse(data['forecast']['forecastday'][2]['date']),
      thirdDayIcon: jsonData3['condition']['icon'],
      thirdDayMaxTemp: jsonData3['maxtemp_c'],
      thirdDayMinTemp: jsonData3['mintemp_c'],

    );

  }

  String getImage()
  {
    if(weatherStateName=='Clear'||weatherStateName=='Light Cloud')
    {
      return 'assets/images/clear.png';
    }
    else if (weatherStateName=='Sleet'||weatherStateName=='Snow'||
        weatherStateName=='Hail')
    {
      return 'assets/images/snow.png';
    }
    else if (weatherStateName=='Heavy Cloud')
    {
      return 'assets/images/cloudy.png';
    }
    else if (weatherStateName=='Light Rain'||weatherStateName=='Heavy rain'||
        weatherStateName=='Showers' || weatherStateName== 'Patchy rain possible' )
    {
      return 'assets/images/rainy.png';
    }
    else if (weatherStateName=='Thunderstorm' ||weatherStateName== 'Thunder')
    {
      return 'assets/images/thunderstorm.png';
    }
    else
    {
      return 'assets/images/clear.png';
    }

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
     else if (weatherStateName=='Light Rain'||weatherStateName=='Heavy rain'||
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
   @override
  String toString() {
    // TODO: implement toString
    return weatherStateName;
  }

}