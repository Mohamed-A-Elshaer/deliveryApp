import 'package:flutter/material.dart';
import '../../../../../core/generated/assets.dart';
import 'custom_popular_product_item.dart';

class CustomPopularProductList extends StatelessWidget{
  const CustomPopularProductList({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'image': Assets.imagesRealPizza,
      'text': 'Pizza Clásica',
      'subText': 'Salsa clásica de la casa',
      'price': '\$12.58',
      'isTarget':false
    },
    {
      'image': Assets.imagesRealburger,
      'text': 'Hamburguesa mix',
      'subText': 'Doble carne con queso',
      'price': '\$12.58',
      'isTarget':true,
    },
    {
      'image': Assets.imagesRealHotdog,
      'text': 'Salchicha Salvaje',
      'subText': 'Lore ipsum',
      'price': '\$12.58',
      'isTarget':false
    },
    {
      'image': Assets.imagesBurrito,
      'text': 'Burrito Loco',
      'subText': 'Lore ipsum',
      'price': '\$12.58',
      'isTarget':false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CustomPopularProductItem(
            image: products[index]['image']!,
            text: products[index]['text']!,
            subText: products[index]['subText']!,
            price: products[index]['price']!,
            isTarget: products[index]['isTarget']!,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 9),
      ),
    );
  }
}

