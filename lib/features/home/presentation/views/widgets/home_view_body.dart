import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';
import 'package:inicio/core/widgets/custom_app_bar.dart';
import 'package:inicio/core/widgets/custom_text_field.dart';

class HomeViewBody extends StatelessWidget{
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(leading: CustomTextField(),
     title: Text('Buscar',style: TextStyles.poppinsW600S22.copyWith(color: Color(0xff5117AC)),),

     ),
    );
  }

}