import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/application/weather_cubit/weather_cubit.dart';
import 'package:task/infrastructure/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/Screens/home_screen.dart';
import 'application/theme_cubit/theme_cubit.dart';
import 'core/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late WeatherRepository weatherRepository = WeatherRepository();
  InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    (context).read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<WeatherCubit>(create: (txt) => WeatherCubit(weatherRepository,internetConnectionChecker)),
      ],
      child: const WeatherApp(),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:const HomeScreen(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
        );
  }
}
