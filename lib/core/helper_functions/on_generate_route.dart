import 'package:flutter/material.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){

    case SplashView.routeName:
      return MaterialPageRoute(builder: (context)=>const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context)=>const OnBoardingView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context)=>const HomeView());

    default:
      return MaterialPageRoute(builder: (context)=>const Scaffold());


  }


}