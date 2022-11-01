import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/domain/models/weather_data.dart';
import 'package:task/infrastructure/weather_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  final InternetConnectionChecker internetConnectionChecker;
  late StreamSubscription streamSubscription;

  WeatherCubit(this.weatherRepository,this.internetConnectionChecker) : super(LoadingData()) {
    getWeatherData();
  }

  void getWeatherData() {
    try {
      streamSubscription = internetConnectionChecker.onStatusChange.listen((status) async {
        if (status==InternetConnectionStatus.connected){
          List<dynamic> weather = await weatherRepository.getWeatherInfo();
          emit(LoadedData(list: weather));
        } else if (status==InternetConnectionStatus.disconnected) {
          emit(NoConnection());
        } else{
          emit(ErrorLoadingData(message: 'something Wrong'));
        }
      });
    } catch (e) {
      emit(ErrorLoadingData(message: e.toString()));
    }
  }
}
