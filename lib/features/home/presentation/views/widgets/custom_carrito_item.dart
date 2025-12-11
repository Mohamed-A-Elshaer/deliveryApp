import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';
import 'package:inicio/core/generated/assets.dart';

class CustomCarittoItem extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final double basePrice;
  final int amount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;
  
  const CustomCarittoItem({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
    required this.basePrice,
    required this.amount,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });
  
  double get currentPrice => basePrice * amount;


  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
      children:[
        Container(
        width: 270,
        height: 301,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.051),
              offset: const Offset(0, 0),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 31,),
                ClipOval(
                  child: Image.asset(
                      img,
                  height: 95,
                  width: 95,
                  fit: BoxFit.cover,),
                ),
                SizedBox(height: 11,),
                Text(title,style: TextStyles.poppinsW600S19.copyWith(color: Color(0xff153E73)),),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(subTitle,
                    style: TextStyles.poppinsW300S9.copyWith(color: Color(0xff66667E)),),
                ),
                SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: amount > 1 ? onDecrement : null,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              CupertinoIcons.minus,
                              color: amount > 1 ? Color(0xff5117AC) : Colors.grey,
                              size: 15,
                            ),
                          ),
                        ),

                        SizedBox(width: 8.96,),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            amount.toString(),
                            key: ValueKey<int>(amount),
                            style: TextStyles.poppinsW500S14.copyWith(color: Color(0xff5117AC)),
                          ),
                        ),
                        SizedBox(width: 8.96,),
                        GestureDetector(
                          onTap: onIncrement,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xff5117AC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(CupertinoIcons.plus,color: Colors.white,size: 15,),
                          ),
                        ),
                        SizedBox(width: 26,),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            '\$${currentPrice.toStringAsFixed(2)}',
                            key: ValueKey<double>(currentPrice),
                            style: TextStyles.poppinsW600S20.copyWith(color: Color(0xff20D0C4)),
                          ),
                        )



                        ],
                    ),
                  ),
                )

              ],
            ),
          ),

      ),
        Positioned(
          top: -10,
          right: -10,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              width: 48.06,
              height: 48.06,
              decoration: const BoxDecoration(
                color: Color(0xFFF1395E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.trash,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ]
    );
  }
}