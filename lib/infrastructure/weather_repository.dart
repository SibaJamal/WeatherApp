import 'package:task/domain/models/weather_data.dart';
import 'weather_data_provider.dart';
import 'package:task/core/constant.dart';



class WeatherRepository{

  Future<List<dynamic>> getWeatherInfo()async{
    NetworkHelper helper;
    List<dynamic> weatherInfo = [];

      helper = NetworkHelper('http://api.openweathermap.org/data/2.5/forecast?id=292223&APPID=$apiKey');
      var info = await helper.fetchData();
      var list= info['list'];
      weatherInfo = list.map((element)=>WeatherData.fromJson(element)).toList();
   return weatherInfo;
  }
}
