import 'package:flutter/cupertino.dart';
import 'package:inicio/core/generated/app_text_styles.dart';

class CustomCategoryItem extends StatelessWidget{
  final Color color;
  final String image;
  final String category;
  const CustomCategoryItem({super.key,required this.color,required this.image,required this.category});
  @override
  Widget build(BuildContext context) {
    return Column(
children: [
  Container(
    height: 64,
    width: 64,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color.withOpacity(0.47),
    ),
    child: Center(
      child: Image.asset(
        image,
        width: 53,
        height: 53,
        fit: BoxFit.contain,
      ),
    ),
  ),
  const SizedBox(height: 5,),
  Text(category,style: TextStyles.poppinsW500S12.copyWith(color: const Color(0xff153E73)),)
],
    );
  }


}