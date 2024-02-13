import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<weatherState> {
  GetWeatherCubit() : super(weatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
        weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(weatherLoadedState(weatherModel!));
    } catch (e) {
      emit(weatherFailureState());
    }
  }
}