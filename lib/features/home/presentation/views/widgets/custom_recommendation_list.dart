import 'package:flutter/material.dart';
import '../../../../../core/generated/assets.dart';
import 'custom_recommendation_item.dart';

class CustomRecommendationList extends StatelessWidget{
  const CustomRecommendationList({super.key});

  final List<Map<String, String>> recommendations = const [
    {
      'image': Assets.imagesMalteadasTropicales,
      'category': 'Naturales',
      'title': 'Malteadas tropicales',
      'subtitle': 'Elaborado con jugos naturales',
      'price': '\$12.58',
    },
    {
      'image': Assets.imagesOrangeJuice,
      'category': 'Naturales',
      'title': 'Malteadas tropicales',
      'subtitle': 'Elaborado con jugos naturales',
      'price': '\$12.58',
    },
    {
      'image': Assets.imagesMalteadasTropicales,
      'category': 'Naturales',
      'title': 'Malteadas tropicales',
      'subtitle': 'Elaborado con jugos naturales',
      'price': '\$12.58',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return CustomRecommendationItem(
            image: recommendations[index]['image']!,
            category: recommendations[index]['category']!,
            title: recommendations[index]['title']!,
            subtitle: recommendations[index]['subtitle']!,
            price: recommendations[index]['price']!,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 9),
      ),
    );
  }
}

