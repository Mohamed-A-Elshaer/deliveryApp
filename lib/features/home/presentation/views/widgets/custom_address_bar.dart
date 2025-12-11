import 'package:flutter/material.dart';

import 'custom_address_box.dart';

class CustomAddressBar extends StatefulWidget{
  const CustomAddressBar({super.key});

  @override
  State<CustomAddressBar> createState() => _CustomAddressBarState();
}

class _CustomAddressBarState extends State<CustomAddressBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 13.5),
     child: Row(
       children: [
         Expanded(
           child: GestureDetector(
             onTap: () {
               setState(() {
                 selectedIndex = 0;
               });
             },
             child: CustomAddressBox(
               address: 'Mi casa',
               isSelected: selectedIndex == 0,
             ),
           ),
         ),
         const SizedBox(width: 10.83),
         Expanded(
           child: GestureDetector(
             onTap: () {
               setState(() {
                 selectedIndex = 1;
               });
             },
             child: CustomAddressBox(
               address: 'Mi Trabajo',
               isSelected: selectedIndex == 1,
             ),
           ),
         ),
         const SizedBox(width: 10.83),
         Container(
           width: 50.31,
           height: 50.31,
           decoration: BoxDecoration(
             color: const Color(0xff5117AC),
             shape: BoxShape.circle,
             border: Border.all(
               color: const Color(0xff5117AC),
               width: 3,
             ),
           ),
           child: const Icon(
             Icons.add,
             color: Colors.white,
             size: 24,
           ),
         ),
       ],
     ),
   );
  }
}