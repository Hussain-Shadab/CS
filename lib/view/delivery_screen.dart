
import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:coffee_shop/resources/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 430.h,
            width: double.infinity,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              children: [
                Divider(
                  color: AppColors.greyColor,
                  thickness: 5,
                  endIndent: 200,
                  indent: 200,
                ),
                SizedBox(height: 10.h,),
                CustomText(text: '10 Minutes Left',
                fontSize: 14.sp,
                  color: AppColors.titleTextColor,
                  fontWeight: FontWeight.w600,

                ),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Delivery to',
                    fontSize: 12.sp,
                      color: AppColors.subTitleTextColor,
                    ),
                    CustomText(text: ' Sohan Highway.Islamabads',
                      fontSize: 12.sp,
                      color: AppColors.titleTextColor,
                      fontWeight: FontWeight.w600,
                    ),

                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    TimeContainer(),
                    TimeContainer(),
                    TimeContainer(),
                    TimeContainer(),
                  ],
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 77.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.greyColor,
                      width: 2.w
                    )
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 56.h,
                        width: 56.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.greyColor,
                            width: 2.w,
                          )
                        ),
                        child: Transform.flip(
                          flipX: true,
                          child: Icon(Icons.delivery_dining_outlined,
                            color: AppColors.primaryColor,
                          size: 28,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Delivered your order',
                          fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.titleTextColor,
                          ),
                          CustomText(text: 'We will deliver your goods to you\nin '
                              'the shortes possible time',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.titleTextColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                   Container(
                     height: 56.h,
                     width: 56.w,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12.r),
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(12.r),
                       child: Image.asset(
                         AppImages.mochaFusi,
                         height: 56.h,
                         width: 56.w,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Brooklyn Simmons',
                        fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppColors.titleTextColor,
                        ),
                        SizedBox(height: 2.h,),
                        CustomText(text: 'Brooklyn Simmons',
                          fontSize: 12.sp,
                          color: AppColors.subTitleTextColor,
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      height: 44.h,
                      width: 46.w,
                      backgroundColor: AppColors.whiteColor,
                      border: Border.all(
                        width: 2.w,
                        color: AppColors.greyColor,

                      ),
                      iconData: Icons.call,
                      iconColor: AppColors.titleTextColor,
                      alignment: Alignment.center,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
class TimeContainer extends StatefulWidget {
  const TimeContainer({super.key});

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5.h,
          width: 40.w,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.green,
          ),
        ),
        SizedBox(width: 2.w,),
      ],
    );

  }
}
