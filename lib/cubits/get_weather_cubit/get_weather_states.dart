import 'package:weather_app/model/weather_model.dart';

class weatherState {}

class weatherInitialState extends weatherState {}

class weatherLoadedState extends weatherState {
  final WeatherModel weatherModel;

  weatherLoadedState(this.weatherModel);
}

class weatherFailureState extends weatherState {}

