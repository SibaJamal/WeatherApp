import 'package:flutter/material.dart';
import 'package:task/domain/models/weather_data.dart';
import 'package:task/presentation/Screens/details_screen.dart';
import 'package:task/core/constant.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData weatherData;
  const WeatherCard({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(weatherData)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          decoration:BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary , width: 3),
                  borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 ImageIcon(
                  AssetImage("images/icons/${weatherData.icon}.png"),
                  size: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(weatherData.weatherMain,style:kTextStyleBold),
                    Text('${weatherData.temp.toString()}°'),
                  ],
                ),
                Column(
                  children: [
                    Text(weatherData.cityName.toString(),style:kTextStyle.copyWith(fontSize:25)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
