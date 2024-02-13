import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/no_weather_page.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/weather_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,weatherState >(
        builder: (context, state) {
          if(state is weatherInitialState){
            return NoWeatherBody();
          }
          else if (state is weatherLoadedState) {
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          }
          else 
          {
            return Text("opps there is not found");
          }
        },
      )
    );
  }
}
