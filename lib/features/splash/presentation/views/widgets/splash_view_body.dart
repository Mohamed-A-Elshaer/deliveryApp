import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/core/generated/assets.dart';

import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget{
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Image.asset(
            Assets.imagesRestIcon,
            height: 300,
          ),
        ),
      ),
    );
  }
}