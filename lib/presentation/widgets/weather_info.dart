import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String title;
  final String info;
  final IconData? icon;

  const WeatherInfo({Key? key,  required this.title, required this.info,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(icon??Icons.device_thermostat,color:Color(0xffbed5fd),),
        ),
        Text('$title:',style: const TextStyle(color: Color(0xffbed5fd),fontWeight: FontWeight.w600,fontSize: 18)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
          child: Text(info,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18)),
        ),
      ],
    );
  }
}
