import 'package:flutter/material.dart';
import 'package:task/domain/models/weather_data.dart';
import 'package:task/core/constant.dart';

class DetailsScreen extends StatelessWidget {
  static String id = 'Home Screen';

  final WeatherData weatherData;
  const DetailsScreen(this.weatherData);

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
          Text(weatherData.weatherMain),
          Text('Temperature: ${weatherData.temp.toString()}°'),
          Text('Minimum Temperature: ${weatherData.minTemp.toString()}°'),
          Text('Maximum Temperature: ${weatherData.maxTemp.toString()}°'),
          Text('Humidity: ${weatherData.humidity.toString()}'),

        ],
      ),
    );
  }
}
