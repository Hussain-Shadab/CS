import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constant/colors.dart';

class ItemDetailScreen extends StatefulWidget {
  final Color? color;
  const ItemDetailScreen({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  bool isExpanded = false;
  String selectedSize = 'M';

  void _selectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    String fullText =
        'Discover the perfect coffee for your mood! ☕ Indulge in the smooth and creamy Flat White, or enjoy the rich blend of espresso and chocolate in Mocha Fusi. For a bold kick, try Coffee Machao, a flavorful Macchiato, or savor the delicate taste of Coffee Pana, a classic latte. If you are looking for something unique, the Latte Special offers a signature twist to your coffee experience. No matter your choice, every sip is crafted to perfection! ✨,';
    String shortText = fullText.substring(0, 139);
    return Scaffold(
      backgroundColor: AppColors.greyColor.withOpacity(0.2),
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.blackColor,
        ),
        title: CustomText(
          text: 'Detail',
          style: TextStyle(
              color: AppColors.blackColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.favorite_border_outlined,
              color: AppColors.blackColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                  height: 204.h,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        AppImages.coffeeMachao,
                        height: 205.h,
                        fit: BoxFit.cover,
                      ))),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'CoffeMachao',
                style: TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'ice/hot',
                    style: TextStyle(
                        color: AppColors.subTitleTextColor, fontSize: 18.sp),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          height: 46.h,
                          width: 46.w,
                          backgroundColor: AppColors.secondaryColor,
                          // iconData: Icons.delivery_dining_outlined,textColor: AppColors.primaryColor,
                          iconData: null,
                          child: Transform.flip(
                            flipX: true,
                            // alignment: Alignment.center,
                            // transform: Matrix4.rotationY(3.20),
                            child: Icon(
                              Icons.delivery_dining_outlined,
                              color: AppColors.primaryColor,
                            ),
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomButton(
                        height: 46.h,
                        width: 46.w,
                        backgroundColor: AppColors.secondaryColor,
                        iconData: Icons.coffee,
                        textColor: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomButton(
                        height: 46.h,
                        width: 46.w,
                        backgroundColor: AppColors.secondaryColor,
                        iconData: Icons.inventory_2_outlined,
                        textColor: AppColors.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outlined,
                    color: AppColors.ratingStarColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText(
                    text: '4.3',
                    style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  CustomText(
                    text: '(200)',
                    style: TextStyle(
                      color: AppColors.subTitleTextColor,
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                thickness: 0.5,
                indent: 15.sp,
                endIndent: 15.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                text: 'Description',
                style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: AppColors.subTitleTextColor,
                        fontSize: 15.sp,
                      ),
                      children: [
                    TextSpan(
                      text: isExpanded ? fullText : '$shortText...',
                    ),
                    TextSpan(
                        text: isExpanded ? 'Readless' : 'Readmore',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          })
                  ])),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'Size',
                style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeButtons(
                      label: 'S',
                      isSelected: selectedSize == 'S',
                      onTap: () => _selectedSize('S')),
                  SizeButtons(
                    label: 'M',
                    isSelected: selectedSize == 'M',
                    onTap: () => _selectedSize('M'),
                  ),
                  SizeButtons(
                      label: 'L',
                      isSelected: selectedSize == 'L',
                      onTap: () => _selectedSize('L'))
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 118.h,
                width: 375.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                ),
                child: Padding(padding: EdgeInsets.all(10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'Price',fontSize: 14.sp,color: AppColors.subTitleTextColor,),
                      CustomText(text: '\$ 45',fontSize: 20.sp,color: AppColors.primaryColor,),

                      ],
                    ),
                    GestureDetector(
                      child: CustomButton(
                        borderRadius: BorderRadius.circular(20.r),
                        height: 56.h,
                        width: 217.w,
                        text: 'Buy Now',
                        iconColor: AppColors.whiteColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.whiteColor,

                      ),
                    )
                  ],
                ),
                ),
        
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

class SizeButtons extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const SizeButtons(
      {Key? key,
      required this.label,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 100.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryColor.withOpacity(0.2)
                : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color:
                    isSelected ? AppColors.primaryColor : AppColors.greyColor,
                width: 2)),
        child: Text(
          label,
          style: TextStyle(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.titleTextColor,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
