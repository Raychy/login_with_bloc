import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_with_bloc/Repository/whether_repo.dart';
import 'package:login_with_bloc/bloc/weather_bloc.dart';
import 'package:login_with_bloc/weather_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:BlocProvider(
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child:WeatherScreen(),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RepositoryProvider(
//         create: (context) => AuthRepository(), 
//         child: BlocProvider(
//           create: (context) =>
//               SessionCubit(authRepo: context.read<AuthRepository>()),
//           child: AppNavigator(),
//         ),
//       ),
//     );
//   }
// }