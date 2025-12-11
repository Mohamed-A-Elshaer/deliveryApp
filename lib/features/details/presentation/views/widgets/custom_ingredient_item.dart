import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';

class CustomIngredientItem extends StatelessWidget {
  final String image;
  final String ingredient;

   const CustomIngredientItem({
    super.key,
    required this.image,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            width: 110,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          ingredient,
          style: TextStyles.poppinsW300S10.copyWith(
            color: const Color(0xff9A9A9A),
          ),
        ),
      ],
    );
  }
}

