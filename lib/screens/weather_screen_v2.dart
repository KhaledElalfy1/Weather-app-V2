import 'package:flutter/material.dart';


import '../component/weather_column.dart';
import '../component/weather_row.dart';
import '../helpers/constats.dart';
import '../models/weather_model.dart';




class WeatherScreenV2 extends StatelessWidget {
  final WeatherModel?weatherData;
  DateTime now = DateTime.now();

  WeatherScreenV2({super.key,required this.weatherData});

  @override
  Widget build(BuildContext context) {

    return  Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(weatherData!.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),
                    const Spacer(flex: 1,),
                    const Icon(Icons.notifications_active_rounded,
                      color: Colors.white,
                      size: 35,
                    ),

                  ],
                ),

              ),
              Image.asset(weatherData!.getImage()),
              Text(weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(weatherData!.weatherStateName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('max.: ${weatherData!.maxTemp.toInt()}C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width:15,),
                  Text('min.: ${weatherData!.minTemp.toInt()}C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Container(
                width: 343,
                height: 47,
                decoration: BoxDecoration(
                    color: weatherData!.getColor()[400],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    const Spacer(flex: 1,),
                    const Icon(Icons.water_drop_outlined,color: Colors.white,),
                    Text('${weatherData!.rainRate}%',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    const Spacer(flex: 2,),
                    const Icon(Icons.stacked_line_chart,color: Colors.white,),
                    const Text('18%',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    const Spacer(flex: 2,),
                    const Icon(Icons.wind_power,color: Colors.white,),
                    Text('${weatherData!.windSpeed} km/h',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    const Spacer(flex: 1,),
                  ],
                ),
              ),
              const SizedBox(height: 22,),
              Container(
                width: 343,
                height: 217,
                decoration: BoxDecoration(
                    color: weatherData!.getColor()[300],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Today',
                            style:TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ) ,
                          ),
                          Text('${monthes[weatherData!.date.month]},${weatherData!.date.day}',
                            style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ) ,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherCoulmn(houre: (now.hour+1)%24,temp: weatherData!.tempHour1,weatherIcon: weatherData!.iconHour1),
                          WeatherCoulmn(houre: (now.hour+2)%24,temp: weatherData!.tempHour2,weatherIcon: weatherData!.iconHour2),
                          WeatherCoulmn(houre: (now.hour+3)%24,temp: weatherData!.tempHour3,weatherIcon: weatherData!.iconHour3),
                          WeatherCoulmn(houre: (now.hour+4)%24,temp: weatherData!.tempHour4,weatherIcon: weatherData!.iconHour4),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22,),
              Container(
                width: 343,
                height: 200,
                decoration: BoxDecoration(
                    color: weatherData!.getColor()[300],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Next forecast',
                            style:TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ) ,
                          ),
                          Icon(Icons.calendar_month_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      WeatherRaw(currentDate: weatherData!.scenodDayDate,
                          currentIcon: weatherData!.secondDayIcon,currentMax: weatherData!.secondDayMaxTemp,
                        currentMin: weatherData!.secondDayMinTemp,
                      ),
                      WeatherRaw(currentDate: weatherData!.thirdDayDate, currentIcon:  weatherData!.thirdDayIcon,
                        currentMax: weatherData!.thirdDayMaxTemp,currentMin: weatherData!.thirdDayMinTemp,
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
