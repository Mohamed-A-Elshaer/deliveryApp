import 'package:flutter/cupertino.dart';
import 'package:inicio/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget{

  static const routeName="splash";

  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SplashViewBody();
  }


}