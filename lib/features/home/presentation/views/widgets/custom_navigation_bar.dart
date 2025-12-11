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
    const double notchRadius = 50;

    return SizedBox(
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
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
                      NavIcon(
                        icon: SvgPicture.asset(
                          Assets.imagesHomeIcon,
                          height: 23,
                          width: 23,
                        ),
                        onTap: () => onItemTapped(0),
                      ),

                      Transform.translate(
                        offset: const Offset(-34, 0),
                        child: NavIcon(
                          icon: SvgPicture.asset(
                            Assets.imagesShopIcon,
                            height: 23,
                            width: 23,
                          ),
                          onTap: () => onItemTapped(2),
                        ),
                      ),

                      Transform.translate(
                        offset: const Offset(40, 0),
                        child:NavIcon(
                            icon:  const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              size: 28,
                            ),
                            onTap: () {}
                        ),
                      ),

                      NavIcon(
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

          Positioned(
            bottom: 12,
            child: NavIcon(
              size: 60,
              onTap: () => onItemTapped(2),
              icon: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xff4B0082),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_basket,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({
    this.icon,
    required this.onTap,
    this.size = 40,
  });
  final Widget? icon;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: Center(child: icon),
      ),
    );
  }
}

