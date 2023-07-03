import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_v2/models/weather_model.dart';
import 'package:weather_app_v2/providers/provider_model.dart';
import 'package:weather_app_v2/screens/home_page.dart';

void main() {
  runApp(  ChangeNotifierProvider(
    create: (context){
      return ProviderModel();
    },
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<ProviderModel>(context).weatherData== null ? Colors.blue
            :
        Provider.of<ProviderModel>(context).weatherData!.getColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
