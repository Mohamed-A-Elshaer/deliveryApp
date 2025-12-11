import 'package:flutter/material.dart';
import 'package:inicio/core/widgets/custom_app_bar.dart';
import 'package:inicio/core/widgets/custom_button.dart';
import 'package:inicio/features/home/presentation/views/widgets/custom_address_bar.dart';
import 'package:inicio/features/home/presentation/views/widgets/custom_carrito_item.dart';
import 'package:inicio/features/home/presentation/views/widgets/custom_category_list.dart';
import '../../../../../core/generated/app_text_styles.dart';
import 'custom_carrito_list.dart';
import 'custom_navigation_bar.dart';
import 'custom_address_box.dart';

class CarittoViewBody extends StatefulWidget{
  @override
  State<CarittoViewBody> createState() => _CarittoViewBodyState();
}

class _CarittoViewBodyState extends State<CarittoViewBody> {
  double total = 0.0;

  void _updateTotal(double newTotal) {
    setState(() {
      total = newTotal;
    });
  }

  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)} usd';
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(
       color: Colors.white,
       title: Text('Carrito',style: TextStyles.poppinsW600S22.copyWith(color: const Color(0xff5117AC)),),
     ),
     bottomNavigationBar: CustomNavigationBar(
       selectedIndex: 2,
       onItemTapped: (i) {
         if (i == 0) {
           Navigator.of(context).pop();
         }
       },
     ),
     body: Column(
       children: [
         SizedBox(height: 30,),
         CustomAddressBar(),
         CustomCarritolist(onTotalChanged: _updateTotal),
         SizedBox(height: 3,),
         Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 13.5),
               child: SingleChildScrollView(
                 child: Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: Color(0xffF9F9F9),
                     borderRadius: BorderRadius.circular(15),
                   ),
                   child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 24,vertical: 25),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('SubTotal:',style: TextStyles.poppinsW400S11.copyWith(color: Color(0xff153E73)),),
                             Text(
                               _formatPrice(total),
                               style: TextStyles.poppinsW500S11.copyWith(color: Color(0xff153E73)),
                             )
                           ],
                         ),
                         SizedBox(height: 1,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Envio:',style: TextStyles.poppinsW400S11.copyWith(color: Color(0xff153E73)),),
                             Text('Gratis',style: TextStyles.poppinsW500S11.copyWith(color: Color(0xff153E73)),)
                           ],
                         ),
                         SizedBox(height: 13,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Total:',style: TextStyles.poppinsW600S17.copyWith(color: Color(0xff5117AC)),),
                             Text(
                               _formatPrice(total),
                               style: TextStyles.poppinsW600S17.copyWith(color: Color(0xff5117AC)),
                             )
                           ],
                         ),
                         SizedBox(height: 13,),
                         CustomButton(text: 'Realizar compra', onTap: (){})
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),

             ]
     )
   );
  }

}