import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a city'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getWeather = BlocProvider.of<GetWeatherCubit>(context);
                getWeather.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Enter city name',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 15,
                ), // btt7km fl
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ));
  }
}
