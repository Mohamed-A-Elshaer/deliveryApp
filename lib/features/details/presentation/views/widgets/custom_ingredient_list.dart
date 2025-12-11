import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/generated/assets.dart';
import 'custom_ingredient_item.dart';

class CustomIngredientList extends StatelessWidget {
  CustomIngredientList({super.key});

  final List<CustomIngredientItem> ingredient = [
    const CustomIngredientItem(
      image: Assets.imagesBurgerPiece,
      ingredient: 'Arrachera',
    ),
    const CustomIngredientItem(
      image: Assets.imagesBuns,
      ingredient: 'Pan ajonjoli',
    ),
    const CustomIngredientItem(
      image: Assets.imagesLettuce,
      ingredient: 'Lechuga',
    ),
    const CustomIngredientItem(
      image: Assets.imagesLettuce,
      ingredient: 'Cebolla',
    ),
    const CustomIngredientItem(
      image: Assets.imagesLettuce,
      ingredient: 'Cebolla',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double itemSpacing = -20.0;
    const double itemWidth = 110.0;

    final double contentWidth = itemWidth + ((ingredient.length - 1) * (itemWidth + itemSpacing));

    return ClipRect(
      child: SizedBox(
        height: 120,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            width: contentWidth,
            child: Stack(
              children: List.generate(ingredient.length, (index) {
                return Positioned(
                  left: index * (itemWidth + itemSpacing),
                  child: CustomIngredientItem(
                    image: ingredient[index].image,
                    ingredient: ingredient[index].ingredient,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}