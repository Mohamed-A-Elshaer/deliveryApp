import 'package:flutter/material.dart';
import 'package:inicio/core/widgets/custom_button.dart';
import '../../../../../core/generated/app_text_styles.dart';
import '../../../../../core/generated/assets.dart';
import '../../../../home/presentation/views/home_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody>{
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();


    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              child: Image.asset(
                Assets.imagesRestIcon,
                height: 300,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Explora y pide tu comida favorita',
              style: TextStyles.poppinsW600S16
                  .copyWith(color: const Color(0xffBBBBBB)),
            ),

            const SizedBox(height: 50),

            CustomButton(text: 'Go', onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeView.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
