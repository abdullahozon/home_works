import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                ),
                //getThemeColor(condition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;

    case 'Partly cloudy':
      return Colors.orange;

    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;

    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.lightBlue;

    case 'Heavy rain':
    case 'Heavy rain at times':
      return Colors.blue;

    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;

    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Light snow showers':
      return Colors.indigo;

    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Moderate or heavy snow':
    case 'Moderate or heavy snow showers':
      return Colors.deepPurple;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepOrange;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal;

    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;

    case 'Sleet':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;

    case 'Drizzle':
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.lightBlue;

    default:
      return Colors.blueGrey; // fallback
  }
}
