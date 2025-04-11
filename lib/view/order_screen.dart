
import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/tab_buttons_coffee.dart';
import 'package:coffee_shop/resources/constant/images.dart';
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
      body: Stack(
        children: [
          Container(
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
              Row(
                children: [
                  CustomButton(
                    height: 26.h,
                    width: 120.w,
                    backgroundColor: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(width: 1.5,color: AppColors.bgColor1st.withOpacity(0.5)),
        
                    iconData: Icons.edit,
                  iconColor: AppColors.bgColor1st,
                  text: 'Edit Address',
                    textColor: AppColors.bgColor1st,
                  ),
                  SizedBox(width: 10.w,),
                  CustomButton(
                    height: 26.h,
                    width: 120.w,
                    backgroundColor: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(width: 1.5,color: AppColors.bgColor1st.withOpacity(0.5)),
                    iconData: Icons.note_add_outlined,
                    iconColor: AppColors.bgColor1st,
                    text: 'Add Note',
                    textColor: AppColors.bgColor1st,
                  ),
                ],
              ),SizedBox(height: 10.h,),
              Divider(
                indent: 13,
                endIndent: 13,
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Container(
                    width: 54.w,
                    height: 54.h,
        
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        AppImages.coffePana,
                        fit: BoxFit.cover,
        
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(text: 'text',style: TextStyle(
                        color: AppColors.titleTextColor,
                      fontSize: 20.sp,fontWeight: FontWeight.w600,
                      ),),
                      CustomText(text: 'text',style: TextStyle(
                        color: AppColors.subTitleTextColor,
                        fontSize: 16.sp,fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                  Spacer(),
                  IncrementDecrement()
        
                ],
              ),
              SizedBox(height: 5.h,),
              Divider(
                thickness: 4.h,
                color: AppColors.primaryColor.withOpacity(0.2),
              ),
              SizedBox(height: 5.h,),

              // Disscount button

              Stack(
               children:[
                 CustomButton(
                  height: 56.h,
                  backgroundColor: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.greyColor,
        
                  ),
                  iconData: Icons.percent,
                  iconColor: AppColors.primaryColor,
                  alignment: Alignment.centerLeft,
                  text: '1 Discount is Applies...',
                  textColor: AppColors.titleTextColor,
                  icon: Icon(Icons.arrow_forward,color: AppColors.titleTextColor,size: 20,),
                ),
                 Positioned(
                     left: 340,
                     top: 27,
                     child: Icon(Icons.arrow_forward,
                 color: AppColors.titleTextColor,
        
                 ))
        ]
              ),
              SizedBox(height: 5,),

              // Payment Ment Summary

              CustomText(text: 'Payment Summary',
              fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColors.titleTextColor,
              ),
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Price',fontSize: 16,color: AppColors.subTitleTextColor,),
                  CustomText(text: '\$ 5',fontSize: 16,color: AppColors.titleTextColor,fontWeight: FontWeight.bold,),
                ],
              ),
              SizedBox(height: 3.h,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Delivery Price',fontSize: 16,color: AppColors.subTitleTextColor,),
                  Spacer(),
                  CustomText(text: '\$3.0 to ',fontSize: 16,color: AppColors.titleTextColor,fontWeight: FontWeight.bold,),
                  CustomText(text: '\$2.0',fontSize: 16,color: AppColors.titleTextColor,fontWeight: FontWeight.bold,),
                ],
              ),
              SizedBox(height: 10.h,),

        
            ],
          ),
        ),
          Positioned(
            top: 650,
            // left: 10,
            child: Container(
              height: 170.h,
              width: 360.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
              child: Padding(padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wallet,color: AppColors.primaryColor,),
                        SizedBox(width: 15.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: 'Cash/Wallet',fontWeight: FontWeight.w600,
                            color: AppColors.titleTextColor,

                            ),
                            CustomText(text: '\$ 5',
                              color: AppColors.primaryColor,

                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down_outlined,
                          color: AppColors.titleTextColor,
                        size: 30,
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    CustomButton(
                      height: 40.h,
                      text: 'Order',
                      textColor: AppColors.whiteColor,
                      fontSize: 20,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15.r),

                    ),

                  ],
                )
              ),

            ),

          )
        ]
      ),

    );
  }
}
