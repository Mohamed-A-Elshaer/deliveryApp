import 'package:flutter/cupertino.dart';
import 'package:inicio/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget{
  static const routeName='home';

  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
   return const HomeViewBody();
  }

}