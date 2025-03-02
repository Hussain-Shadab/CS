

import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:coffee_shop/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashOnboardingScreen extends StatelessWidget {
  const SplashOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
body: SafeArea(
  child: Container(
    height: height * 1,
    width: width * 1,
    decoration: BoxDecoration(
        color: AppColors.blackColor,

        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/coffee.png'))
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:280),
          child: CustomText(text:'Fall in Love with\nCoffee in Blissful\nDelight!',
          style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 42,),

          ),
        ),
        SizedBox(height: 20,),
        CustomText(text: 'Welcome to our cozy coffee corner, where\nevery cup is a delightful for you.',
        style: TextStyle(color: Colors.grey,fontSize: 15),
        ),
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(text: 'Get Started', onTap: (){
            Navigator.pushNamed(context, RoutesName.homeScreen,
            arguments: {'imgPath' :'assets/coffee.png',
            'imgtext' : 'Freeshi Coffee'
            }

            );
          },
            height: height *0.07,
            width: width * 1,
              backgroundColor: AppColors.primaryColor ,
            borderRadius: BorderRadius.circular(20),

          ),
        )
      ],
    ),
  ),
),
    );
  }
}
