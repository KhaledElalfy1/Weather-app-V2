import 'package:flutter/material.dart';

class WeatherCoulmn extends StatelessWidget {
   WeatherCoulmn({super.key,required this.houre,required this.temp,required this.weatherIcon});
  int houre;
  double temp;
  String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 155,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${temp.toInt()}',
            style:const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ) ,
          ),
          Image.network('https:$weatherIcon',
            height: 64,
          ),
          Text('$houre:00',
            style:const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ) ,
          ),


        ],
      ),
    );
  }
}
