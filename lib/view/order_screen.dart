
import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/component/custom_text.dart';
import '../resources/constant/colors.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor.withOpacity(0.2),

      appBar: AppBar(
        backgroundColor: AppColors.greyColor.withOpacity(0.010),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.blackColor,
        ),
        title: CustomText(
          text: 'Order',
          style: TextStyle(
              color: AppColors.blackColor, fontWeight: FontWeight.w600),
        ),

      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h,),
            Container(
              height: 45.h,
              width: 330.w,
              padding: EdgeInsets.symmetric(horizontal: 4.r),
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Expanded(child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isDelivery =true;
                      });
                    },
                    child: Container(
                      height: 38.h,
                      // width: 165.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isDelivery ? AppColors.primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: CustomText(
                        text: 'Delvery',
                        style: TextStyle(
                          color: isDelivery ? AppColors.whiteColor : AppColors.titleTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp
                        ),
                      ),
                    ),
                  ),
                  ),
                  Expanded(child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isDelivery =false;
                      });
                    },
                    child: Container(
                      height: 38.h,

                      // width: 165.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isDelivery ? Colors.transparent : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: CustomText(
                        text: 'PickUp',
                        style: TextStyle(
                          color: isDelivery ? AppColors.titleTextColor : AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp
                        ),
                      ),
                    ),
                  ),
                  ),
                ],
              ),


            ),
            SizedBox(height: 12.h,),
            CustomText(
              text: 'Delivery Address',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor,
            ),
            ),
            SizedBox(height: 10.h,),
            CustomText(
                text: 'Jl. Kpg Sutoyo',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.titleTextColor
            ),
            ),
            SizedBox(height: 8.h,),
            CustomText(
                text: 'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.subTitleTextColor
            ),
            ),
            SizedBox(height: 8.h,),
            CustomButton(
              height: 26.h,
              width: 120.w,
              backgroundColor: AppColors.whiteColor,

              icon: Icon(Icons.edit,size: 14.dm,),
            ),

          ],
        ),
      ),
    );
  }
}
