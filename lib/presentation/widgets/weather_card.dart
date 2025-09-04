import 'package:flutter/material.dart';
import 'package:task/domain/models/weather_data.dart';
import 'package:task/presentation/Screens/details_screen.dart';
import 'package:task/core/constant.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {

  Map<String, String> _splitDate(String dtTxt) {
    DateTime dateTime = DateTime.parse(dtTxt);

    String weekday = DateFormat('EEEE').format(dateTime);
    String monthDay = DateFormat('MMMM d').format(dateTime);

    return {
      'weekday': weekday,
      'monthDay': monthDay,
    };
  }
  final WeatherData weatherData;
  const WeatherCard({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final split = _splitDate(weatherData.date);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(weatherData)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
        child: Container(
          decoration:BoxDecoration(
                  color:  Theme.of(context).colorScheme.surface,
                  border: Border.all( width: 0.1),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageIcon(
                 AssetImage("images/icons/${weatherData.icon}.png"),
                 size: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text(weatherData.weatherMain,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(split['weekday'] ?? '',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            Text(split['monthDay'] ?? '',style: const TextStyle(
                              color: Color(0xffbed5fd),
                            )),
                            // Text('${weatherData.temp.toString()}°',style: const TextStyle(
                            //   color: Color(0xffbed5fd),
                            // ),),
                          ],
                        ),
                      ),
                    Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,)
                    ],
                  ),
                ),
                Text('${weatherData.temp.toString()}°',style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
                ),),
                Row(children: [
                  const Icon(Icons.water_drop,color:Color(0xffbed5fd),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${weatherData.humidity}%",style: const TextStyle(color:Color(0xffbed5fd),),),
                  ),
                  const SizedBox(width: 10,),
                  const Icon(Icons.air,color:Color(0xffbed5fd),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${weatherData.speed.toString()}km/h",style: const TextStyle(color:Color(0xffbed5fd),),),
                  )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
