import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_with_bloc/bloc/weather_bloc.dart';
import 'package:login_with_bloc/city_input_field.dart';
import 'package:login_with_bloc/model/weather.dart';

class WeatherScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if(state is WeatherError ){
                return Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('${state.message} '))
                );
              }
            },
            builder: (context, state) {
             if(state is WeatherInitial ){
               return buildInitialInput();
             }
             else if(state is WeatherLoading ){
               return buildLoading();
             }
             else if(state is WeatherLoaded ){
               return buildColumnWithData(state.weather) ;
             }
             else{
               return buildInitialInput();
             } 
            },
          )
          ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
         weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}


