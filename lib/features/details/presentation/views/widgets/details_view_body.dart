import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';
import 'package:inicio/core/generated/assets.dart';
import 'package:inicio/core/widgets/custom_app_bar.dart';
import 'package:inicio/core/widgets/custom_button.dart';
import 'package:inicio/features/details/presentation/views/widgets/custom_ingredient_list.dart';

class DetailsViewBody extends StatefulWidget{
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: Colors.black,
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white)),
        title: Text('Hamburguesa especial', style: TextStyles.poppinsW600S16.copyWith(color: Colors.white)),
      ),
      body: Stack(
        children: [
          // Scrollable content
           Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SizedBox(
                height: 335 + 40 + 334.07,
                child: Stack(
                  children: [
                    Container(
                      height: 335,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(360, 90)
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        Assets.imagesHamburguesaEspecial,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 290,
                      left: -10,
                      right: 0,
                      child: Container(
                        height: 334.07,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(85),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 47),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 33),
                                  Text('Descripción', style: TextStyles.poppinsW600S18.copyWith(color: const Color(0xff153E73))),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero ',
                                    style: TextStyles.poppinsW300S11.copyWith(color: const Color(0xff153E73)),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Ingredientes', style: TextStyles.poppinsW600S18.copyWith(color: const Color(0xff153E73))),
                                      Text('10 ingredientes', style: TextStyles.poppinsW300S10.copyWith(color: const Color(0xff9A9A9A))),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: CustomIngredientList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 260,
                      right: 26,
                      child: GestureDetector(
                        onTap: () => setState(() => isFavorite = !isFavorite),
                        child: Container(
                          width: 48.06,
                          height: 48.06,
                          decoration: BoxDecoration(
                            color: isFavorite
                                ? const Color(0xFFF1395E)
                                : const Color(0xFFBBBBBB),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Fixed bottom container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CustomButton(text: 'Ordenar ahora', onTap: (){},width: 200,),
                  Text('\$12.58',style: TextStyles.poppinsW600S30.copyWith(color: Color(0xff153E73)),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}