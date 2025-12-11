import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';

class CustomRecommendationItem extends StatefulWidget {
  final String image;
  final String category;
  final String title;
  final String subtitle;
  final String price;

  const CustomRecommendationItem({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  State<CustomRecommendationItem> createState() => _CustomRecommendationItemState();
}

class _CustomRecommendationItemState extends State<CustomRecommendationItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 154,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -10,
            bottom: -40,
            child: Image.asset(
              widget.image,
              width: 150,
              height: 190,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: 15,
            right: 15,
            child: GestureDetector(
              onTap: () {
                setState(() => isFavorite = !isFavorite);
              },
              child: Icon(
                isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                color: isFavorite ? Colors.red : const Color(0xffBBBBBB),
                size: 26,
              ),
            ),
          ),

          Positioned.fill(
            left: 140,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category,
                    style: TextStyles.poppinsW300S10.copyWith(color: const Color(0xffC0C2C5)
                  ),),

                  const SizedBox(height: 7),
                  Text(
                    widget.title,
                    style:TextStyles.poppinsW400S10.copyWith(color: const Color(0xff153E73)
                  )),

                  Text(
                    widget.subtitle,
                    style:  TextStyles.poppinsW300S7.copyWith(color: const Color(0xff515F65))
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: TextStyles.poppinsW600S14.copyWith(color: const Color(0xff153E73))
                      ),
                      const Spacer(),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 18,
                            )
                          ],
                        ),
                        child: const Icon(Icons.arrow_forward_ios, size: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
