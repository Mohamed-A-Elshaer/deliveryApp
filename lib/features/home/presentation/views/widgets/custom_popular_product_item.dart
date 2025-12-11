import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inicio/core/generated/app_text_styles.dart';
import 'package:inicio/features/details/presentation/views/details_view.dart';

class CustomPopularProductItem extends StatefulWidget{
  final String image;
  final String text;
  final String subText;
  final String price;
  final bool isTarget;
  const CustomPopularProductItem({
    super.key,
    required this.image,
    required this.text,
    required this.subText,
    required this.price,
    required this.isTarget,
      });

  @override
  State<CustomPopularProductItem> createState() => _CustomPopularProductItemState();
}

class _CustomPopularProductItemState extends State<CustomPopularProductItem> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: widget.isTarget ? ()=> Navigator.of(context).pushNamed(DetailsView.routeName):(){},

     child: Container(
       width: 200,
       height: 261,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(15),
         boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.05),
             offset: const Offset(0, 0),
             blurRadius: 20,
             spreadRadius: 0,
           ),
         ],
       ),
       child: Column(
         children: [
           Align(
               alignment: Alignment.topRight,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18.98,vertical: 13.54),
                 child: IconButton(
                   icon: Icon(
                     isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                     color: isFavorite ? Colors.red : const Color(0xffBBBBBB),
                   ),
                   onPressed: () {
                     setState(() {
                       isFavorite = !isFavorite;
                     });
                   },
                 ),
               )),
           Container(
             width: 90,
             height: 90,
             decoration: BoxDecoration(
               color: Colors.white,
               shape: BoxShape.circle,
               boxShadow: [
                 BoxShadow(
                   color: const Color(0xFF209BD0).withOpacity(0.3),
                   blurRadius: 22,
                   offset: const Offset(0, 0),
                   spreadRadius: 0,
                 ),
               ],
             ),
             child: Center(
              child: Image.asset(
                widget.image,
                width: 75,
                height: 76,
                fit: BoxFit.contain,
              ),
            ),
           ),
           const SizedBox(height: 33,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(widget.text,style: TextStyles.poppinsW400S12.copyWith(color: const Color(0xff515F65)),),
                       Text(widget.subText,style: TextStyles.poppinsW300S7.copyWith(color: const Color(0xff515F65)),),
                       const SizedBox(height: 7,),
                       Text(widget.price,style: TextStyles.poppinsW600S14.copyWith(color: const Color(0xff153E73)),),
                     ],
                   ),
                ),
                Padding(
                 padding: EdgeInsets.fromLTRB(0, 0, 11, 0),
                  child: Container(
                    width: 29,
                    height: 29,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.0784), // 7.84% opacity
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )

              ],
            ),
         ],
       ),
     ),
   );
  }


}