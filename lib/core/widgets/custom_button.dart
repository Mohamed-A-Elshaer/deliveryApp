import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  const CustomButton({super.key,required this.text,required this.onTap,this.width=368,this.height=63});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 23),
       child: Container(
         height: height,
         width:width,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
           gradient: const LinearGradient(
             colors: [
               Color(0xff4A1192),
               Color(0xff2CD5C4),
             ],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           ),
         ),
         child: Center(
           child: Text(
             text,
             style: TextStyles.poppinsW500S18.copyWith(color: Colors.white)
           ),
         ),
       ),
     ),
   );
  }
  
}