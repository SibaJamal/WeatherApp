
class WeatherData {
   late String cityName;
   late String weatherMain;
   late String weatherDescription;
   late String icon;
   late String date;
   late num temp;
   late num minTemp;
   late num maxTemp;
   late num humidity;
   late num speed;
   late int dt;

  WeatherData(this.cityName, this.weatherMain, this.weatherDescription,
      this.temp,this.maxTemp,this.minTemp, this.humidity);

  WeatherData.fromJson(Map<String,dynamic> json){
    cityName = 'Dubai';
    weatherMain= json['weather'][0]['main'];
    weatherDescription= json['weather'][0]['description'];
    icon = json['weather'][0]['icon'];
    date = json['dt_txt'];
    temp = json['main']['temp'];
    minTemp = json ['main']['temp_min'];
    maxTemp = json ['main']['temp_max'];
    humidity = json ['main']['humidity'];
    speed = json['wind']['speed'];

  }
}
