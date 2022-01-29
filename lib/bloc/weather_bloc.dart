import 'package:bloc/bloc.dart';
import 'package:login_with_bloc/Repository/whether_repo.dart';
import 'package:login_with_bloc/model/weather.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
    final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial());
 
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
   if(event is GetWeatherEvent ){
       try {
      yield(WeatherLoading());
      final weather = await weatherRepository.fetchWeather(event.cityName);
      yield(WeatherLoaded(weather));
    } on NetworkException {
      yield(WeatherError("Opps! Network failed"));
    }
    
   }
  }
}
