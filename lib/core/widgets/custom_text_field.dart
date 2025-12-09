import 'package:flutter/material.dart';

import '../generated/app_text_styles.dart';

class CustomTextField extends StatelessWidget{
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      height: 33,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFE2EDF2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 6),
          const Icon(
            Icons.search,
            size: 7.13,
            color: Color(0xFF5117AC),
          ),
          const SizedBox(width: 6),
          Text(
            "Buscar",
            style: TextStyles.poppinsW400S10.copyWith(
              color: const Color(0xFFE2EDF2),
            ),
          ),
        ],
      ),
    );
  }
  
  
}