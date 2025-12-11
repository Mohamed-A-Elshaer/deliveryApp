import 'package:flutter/material.dart';
import 'package:inicio/core/widgets/custom_app_bar.dart';
import '../../../../../core/generated/app_text_styles.dart';
import 'custom_navigation_bar.dart';

class CarittoViewBody extends StatelessWidget{
  const CarittoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(color: Colors.white,
     title: Text('Carrito',style: TextStyles.poppinsW600S22.copyWith(color: const Color(0xff5117AC)),),
     ),
     bottomNavigationBar: CustomNavigationBar(
       selectedIndex: 2,
       onItemTapped: (i) {
         if (i == 0) {
           Navigator.of(context).pop();
         }
         // if basket tapped while here, stay
       },
     ),
     body: Column(
       children: [

       ],
     ),
   );
  }

}