import 'package:flutter/cupertino.dart';
import '../../../../../core/generated/assets.dart';
import 'custom_category_item.dart';

class CustomCategoryList extends StatelessWidget{
   CustomCategoryList({super.key});

  final List<CustomCategoryItem> categories = [
    const CustomCategoryItem(
      color: Color(0xffD0E6A5),
      image: Assets.imagesTacos,
      category: 'Tacos',
    ),
    const CustomCategoryItem(
      color: Color(0xff86E3CE),
      image: Assets.imagesFrias,
      category: 'Frias',
    ),
    const CustomCategoryItem(
      color: Color(0xffFFDD95),
      image: Assets.imagesBurger,
      category: 'Burger',
    ),
    const CustomCategoryItem(
      color: Color(0xffFFACAC),
      image: Assets.imagesPizza,
      category: 'Pizza',
    ),
    const CustomCategoryItem(
      color: Color(0xffCCAAD9),
      image: Assets.imagesBurrito,
      category: 'Burrito',
    ),
  ];
  @override
  Widget build(BuildContext context) {
   return  SizedBox(
     height: 100,
     child: ListView.separated(
       scrollDirection: Axis.horizontal,
       itemCount: categories.length,
       itemBuilder: (context, index) {
         return CustomCategoryItem(
           color: categories[index].color,
           image: categories[index].image,
           category: categories[index].category,
         );
       },
       separatorBuilder: (_, __) => const SizedBox(width: 28),
     ),
   );
  }
  
  
}