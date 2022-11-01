import 'package:flutter/material.dart';
import 'package:task/application/weather_cubit/weather_cubit.dart';
import 'package:task/presentation/widgets/weather_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomeScreen extends StatefulWidget {

  static String id = 'Home Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is LoadedData) {
            return ListView.separated(
              physics: (isLandscape)? const AlwaysScrollableScrollPhysics() :const NeverScrollableScrollPhysics(),
              separatorBuilder: (context,index) {
                return const SizedBox(height:25,);
              },
                itemCount:5,
                itemBuilder: (context, index) {
                  return WeatherCard( weatherData:state.list[index]);
                });} else if (state is LoadingData) {
              return const Center(
                  child: CircularProgressIndicator(value: null,)
              );}
            else if (state is ErrorLoadingData) {
              return Center(child: Text(state.message));
            } else{
              return const Center(child: Text('No connection'));
            }
          },
        )
    );
  }
}
