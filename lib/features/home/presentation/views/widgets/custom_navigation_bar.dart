import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inicio/core/generated/assets.dart';
import 'custom_notched_bar_clipper.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final double barWidth = MediaQuery.of(context).size.width - 40;
    const double barHeight = 64;
    const double cornerRadius = 20;
    const double notchRadius = 50; // enlarged notch

    return SizedBox(
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // -------------------------
          // BOTTOM NAVIGATION BAR (single piece with central notch)
          // -------------------------
          Positioned(
            bottom: 10, // lowered slightly inside the SizedBox
            child: PhysicalShape(
              elevation: 8,
              color: Colors.white,
              shadowColor: Colors.black.withOpacity(0.288),
              clipper: CustomNotchedBarClipper(
                cornerRadius: cornerRadius,
                notchRadius: notchRadius,
                width: barWidth,
                height: barHeight,
              ),
              child: SizedBox(
                width: barWidth,
                height: barHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home (clickable)
                      _NavIcon(
                        icon: SvgPicture.asset(
                          Assets.imagesHomeIcon,
                          height: 23,
                          width: 23,
                        ),
                        onTap: () => onItemTapped(0),
                      ),

                      // Basket (clickable) with same offset as before
                      Transform.translate(
                        offset: const Offset(-34, 0),
                        child: _NavIcon(
                          icon: SvgPicture.asset(
                            Assets.imagesShopIcon,
                            height: 23,
                            width: 23,
                          ),
                          onTap: () {}
                        ),
                      ),

                      // Favorite (non-clickable, keeps same offset)
                      Transform.translate(
                        offset: const Offset(40, 0),
                        child:_NavIcon(
                            icon:  const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 28,
                            ),
                            onTap: () {}
                        ),
                      ),

                      // Avatar (non-clickable)
                      _NavIcon(
                        icon: const CircleAvatar(
                          radius: 14,
                          backgroundImage:
                          NetworkImage('https://i.pravatar.cc/150?img=12'),
                        ),
                        onTap: () {}
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),

          // -------------------------
          // FLOATING MIDDLE BUTTON
          // -------------------------
          Positioned(
            bottom: 12, // keep button aligned with lowered bar
              child: Container(
                width: 60,
                height:  60,
                decoration: const BoxDecoration(
                  color: Color(0xff4B0082),
                  shape: BoxShape.circle,
                ),
                child: _NavIcon(
                icon: Icon(Icons.shopping_basket_outlined,color: Colors.white,size: 30,),
                onTap: ()=>onItemTapped(2),
                
                )
              ),
            ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({this.icon, required this.onTap});
  final Widget? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Center(child:icon),
      ),
    );
  }
}

