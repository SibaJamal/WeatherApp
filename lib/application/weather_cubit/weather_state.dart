part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class LoadingData extends WeatherState {}

class LoadedData extends WeatherState {
  final List<dynamic> list;
  LoadedData({required this.list});
}

class ErrorLoadingData extends WeatherState {
  final String message ;
  ErrorLoadingData({required this.message});
}


class NoConnection extends WeatherState {}