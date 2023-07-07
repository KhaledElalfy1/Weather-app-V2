import 'package:flutter/material.dart';

import '../helpers/constats.dart';

class WeatherRaw extends StatelessWidget {
   WeatherRaw({super.key,required this.currentDate,required this.currentIcon,required this.currentMax,required this.currentMin});
  DateTime currentDate;
  String currentIcon;
  double currentMax,currentMin;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text('${currentDate.day}/${monthes[currentDate.month]}',
          style:const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ) ,
        ),
        const Spacer(),
        Image.network('https:$currentIcon',height: 64,),

        const Spacer(),
        Text('${currentMax.toInt()}',
          style:const TextStyle(
            color: Colors.white,
            fontSize:20,
          ) ,
        ),
        Text(' ${currentMin.toInt()}',
          style:const TextStyle(
            color: Color(0xff92CDE4),
            fontSize: 20,
          ) ,
        ),
      ],
    );
  }
}
