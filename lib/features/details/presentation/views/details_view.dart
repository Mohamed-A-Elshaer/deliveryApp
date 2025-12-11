import 'package:flutter/cupertino.dart';
import 'package:inicio/features/details/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget{
  static const routeName='details';
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
   return DetailsViewBody();
  }


}