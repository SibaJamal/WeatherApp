import 'package:flutter/material.dart';
import 'package:task/domain/models/weather_data.dart';
import 'package:task/core/constant.dart';

import '../widgets/weather_info.dart';

class DetailsScreen extends StatelessWidget {
  static String id = 'Home Screen';

  final WeatherData weatherData;
  const DetailsScreen(this.weatherData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 30),
              child: Row(
                children:  [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: const Icon(Icons.arrow_back,)),
                  const SizedBox(width: 200 ,),
                ],
              ),
            ),
          ),
          Text(weatherData.weatherDescription,style:kTextStyleBold,),
          ImageIcon(
            AssetImage("images/icons/${weatherData.icon}.png"),
            size: 200,
          ),
          Text(weatherData.weatherMain,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25,)),
         const SizedBox(height:50),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Container(
             padding: const EdgeInsets.all(20.0),
             decoration:BoxDecoration(
               color:  Theme.of(context).colorScheme.surface,
               border: Border.all(width: 0.1),
               borderRadius: BorderRadius.circular(10),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withValues(alpha: 0.2),
                   spreadRadius: 2,
                   blurRadius: 6,
                   offset: const Offset(2, 3),
                 ),
               ],
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 WeatherInfo( title: "Temperature", info:'${weatherData.temp.toString()}°' ),
                 WeatherInfo( title: "Minimum Temperature", info:'${weatherData.minTemp.toString()}°',),
                 WeatherInfo( title: "Maximum Temperature", info:'${weatherData.maxTemp.toString()}°',),
                 WeatherInfo( title: "Humidity", info:'${weatherData.humidity.toString()}%', icon: Icons.water_drop,),


               ],
             ),
           ),
         )
        ],
      ),
    );
  }
}
