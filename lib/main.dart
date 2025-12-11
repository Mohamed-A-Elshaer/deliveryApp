import 'package:flutter/material.dart';
import 'package:inicio/core/helper_functions/on_generate_route.dart';
import 'package:inicio/features/details/presentation/views/details_view.dart';
import 'package:inicio/features/home/presentation/views/home_view.dart';
import 'package:inicio/features/splash/presentation/views/splash_view.dart';

void main(){
  runApp(const Inicio());
}

class Inicio extends StatelessWidget{
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
onGenerateRoute: onGenerateRoute,
initialRoute: HomeView.routeName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }


}