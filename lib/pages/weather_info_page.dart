import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'Update at ${stringToDate(weatherModel.data).hour}:${stringToDate(weatherModel.data).minute}',
            style:const TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https:${weatherModel.image!}',
              ),
              Text(
                '${weatherModel.temp}',
                style:const TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.bold
                ),
              ),
              Column(
                children: [
                  Text('Maxtem: ${weatherModel.maxTemp.round()}',
                  style:const TextStyle(
                    fontSize: 16
                  ),
                ),
                  Text('Mintem: ${weatherModel.minTemp.round()}',
                    style:const TextStyle(
                    fontSize: 16
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(weatherModel.weatherCondition,
          style:const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),)
        ],
      ),
    );
  }
}

DateTime stringToDate(String value)
{
  return DateTime.parse(value);
}
