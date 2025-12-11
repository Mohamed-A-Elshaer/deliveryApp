import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inicio/core/generated/app_text_styles.dart';
import 'package:inicio/core/generated/assets.dart';
import 'package:inicio/core/widgets/custom_app_bar.dart';
import 'package:inicio/core/widgets/custom_text_field.dart';
import 'package:inicio/features/home/presentation/views/caritto_view.dart';
import 'package:inicio/features/home/presentation/views/widgets/custom_recommendation_list.dart';
import 'custom_navigation_bar.dart';
import 'custom_category_list.dart';
import 'custom_popular_product_list.dart';

class HomeViewBody extends StatefulWidget{
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppBar(leading: const CustomTextField(),
     title: Text('Inicio',style: TextStyles.poppinsW600S22.copyWith(color: const Color(0xff5117AC)),),
     actions: [
       IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: Color(0xff20D0C4),)),
       IconButton(onPressed: (){}, icon:SvgPicture.asset(Assets.imagesSaleIcon) ),],
     color: Colors.white,
     ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: 0,
        onItemTapped: (i) {
           if (i == 2) {
            setState(() => index = 2);
            Navigator.of(context).pushNamed(CarittoView.routeName);
          }
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 39,),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 36, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Explorar categorias',style: TextStyles.poppinsW600S16.copyWith(color: const Color(0xff153E73)),),
                  Text('Ver todos',style: TextStyles.poppinsW400S12.copyWith(color: const Color(0xffCFCFCF)),),
                ],
              ),
            ),
            const SizedBox(height: 14,),//or 20
           Padding(
               padding: EdgeInsets.symmetric(horizontal: 14),
               child: CustomCategoryList()),
            const SizedBox(height: 30,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text('Productos populares',
                  style: TextStyles.poppinsW600S16.copyWith(color: const Color(0xff153E73)),),
              ),
            ),
            const CustomPopularProductList(),
            const SizedBox(height: 30,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child:Text('Recomendados',style: TextStyles.poppinsW600S16.copyWith(color: const Color(0xff153E73)),),

              ),
            ),
const CustomRecommendationList(),
const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}