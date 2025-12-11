import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../core/generated/assets.dart';
import 'custom_carrito_item.dart';

class CustomCarritolist extends StatefulWidget {
  const CustomCarritolist({super.key, required this.onTotalChanged});

  final Function(double) onTotalChanged;

  @override
  State<CustomCarritolist> createState() => _CustomCarritolistState();
}

class _CustomCarritolistState extends State<CustomCarritolist> {
  final List<Map<String, dynamic>> products = [
    {
      'img': Assets.imagesBurgerCarrito,
      'title': 'Big Burger Queso',
      'subTitle': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, atque eaque eius ',
      'basePrice': 12.00,
      'amount': 1,
    },
    {
      'img': Assets.imagesBurgerCarritoSec,
      'title': 'Hamburguesa mix',
      'subTitle': 'Doble carne con queso',
      'basePrice': 18.00,
      'amount': 1,
    },
    {
      'img': Assets.imagesBurgerCarrito,
      'title': 'Big Burger Queso',
      'subTitle': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi, atque eaque eius ',
      'basePrice': 10.00,
      'amount': 1,
    },
  ];

  void _updateAmount(int index, int delta) {
    setState(() {
      if (products[index]['amount'] + delta >= 1) {
        products[index]['amount'] += delta;
        _calculateTotal();
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      products.removeAt(index);
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product['basePrice'] * product['amount'];
    }
    widget.onTotalChanged(total);
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CustomCarittoItem(
            img: products[index]['img']!,
            title: products[index]['title']!,
            subTitle: products[index]['subTitle']!,
            basePrice: products[index]['basePrice'],
            amount: products[index]['amount'],
            onIncrement: () => _updateAmount(index, 1),
            onDecrement: () => _updateAmount(index, -1),
            onDelete: () => _deleteItem(index),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 38),
      ),
    );
  }
}