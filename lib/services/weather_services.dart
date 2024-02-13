import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '8d36f28d41584c14841223528230910';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {

      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;

    } on DioException catch (e) {

      final String errorMassage = e.response?.data['error']['message'] ??
          'Opps there was an error,try latter';
      throw Exception(errorMassage);

    } catch (e) {
      log(e.toString());
      throw Exception('Opps there was an error,try latter');
    }
  }
}
