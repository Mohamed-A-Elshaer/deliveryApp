import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inicio/core/generated/app_text_styles.dart';
import 'package:inicio/core/generated/assets.dart';

class CustomAddressBox extends StatelessWidget{
  const CustomAddressBox({
    super.key,
    required this.address,
    this.isSelected = false,
  });
  final String address;
  final bool isSelected;
  
  @override
  Widget build(BuildContext context) {
   return Container(
     width: 175,
     height:65.31,
     decoration: BoxDecoration(
       color: isSelected ? const Color(0xff5117AC) : Colors.transparent,
       borderRadius: BorderRadius.circular(16),
       border: Border.all(
         color: isSelected? const Color(0xff5117AC):const Color(0xffE2EDF2),
         width: isSelected? 0:1,
       ),
     ),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 11.21, vertical: 15.84),
       child: Row(
         children: [
           isSelected? SvgPicture.asset(Assets.imagesWhiteHomeIcon,width: 18.38,height: 19.52,)
                       :SvgPicture.asset(Assets.imagesPurpleHomeIcon,width: 18.38,height: 19.52,),
           const SizedBox(width: 8),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               Text(address,style: isSelected? TextStyles.poppinsW600S10.copyWith(color: const Color(0xffFFFFFF)) :TextStyles.poppinsW600S10.copyWith(color: const Color(0xff383838)),),
               Text('Direción de ejemplo',style: isSelected? TextStyles.poppinsW400S9.copyWith(color: const Color(0xffFFFFFF)):TextStyles.poppinsW400S9.copyWith(color: const Color(0xffAEAEAE)),),
             ],
           )
         ],
       ),
     ),
   );
  }


}