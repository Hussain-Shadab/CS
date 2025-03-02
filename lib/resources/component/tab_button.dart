

import 'package:coffee_shop/resources/component/custom_button.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabButtons extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const TabButtons({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.height,
    this.width,
}) : super(key: key);

  @override
  State<TabButtons> createState() => _TabButtonsState();
}

class _TabButtonsState extends State<TabButtons> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onTap,
      child: Container(

        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.primaryColor : AppColors.coffeeNotSelectedCont,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CustomText(text: widget.text,
            color: widget.isSelected ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
