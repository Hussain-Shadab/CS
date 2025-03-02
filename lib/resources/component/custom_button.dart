import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final String? text; // Button text
  final bool? isSelected;
  final VoidCallback? onTap; // Callback when the button is pressed
  final Color? backgroundColor; // Background color of the button
  final Color? textColor; // Text color of the button
  final double? elevation; // Elevation (shadow) of the button
  final EdgeInsetsGeometry? padding; // Padding inside the button
  final BorderRadiusGeometry? borderRadius; // Border radius of the button
  final double? fontSize; // Font size of the button text
  final FontWeight? fontWeight; // Font weight of the button text
  final Widget? icon; // Optional icon to display alongside the text
  final bool isDisabled;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final Align ? align;
  const CustomButton(
      {Key? key,
        this.iconData,
        this.iconColor,
       this.text,
        this.isSelected,
       this.onTap,
      this.backgroundColor,
      this.textColor,
      this.elevation,
      this.padding,
      this.borderRadius,
      this.fontSize,
      this.fontWeight,
      this.icon,
      this.isDisabled = false,
      this.height,
      this.width,
      this.alignment,
        this.align,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? h ,
        width: width ?? w ,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(

          child:text != null ? Text(
            text!,
            style: TextStyle(

              fontSize: fontSize ?? 16, // Default font size
              fontWeight:
                  fontWeight ?? FontWeight.bold, // Default font weight
            ),
          ): (iconData != null ? Icon(iconData,size: fontSize ?? 24,color: textColor ?? AppColors.whiteColor,):SizedBox()),
        ),
      ),
    );
  }
}
