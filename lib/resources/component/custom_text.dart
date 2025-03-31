

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? subTitle;// Text to display
  final TextStyle? style; // Text style
  final TextAlign? textAlign; // Text alignment
  final int? maxLines; // Maximum number of lines
  final TextOverflow? overflow; // Overflow behavior
  final Color? color; // Text color
  final double? fontSize; // Font size
  final FontWeight? fontWeight; // Font weight
  final String? fontFamily; // Font family
  final double? letterSpacing; // Letter spacing
  final double? wordSpacing; // Word spacing
  final TextDecoration? decoration; // Text decoration (e.g., underline)
  final TextDecorationStyle? decorationStyle; // Decoration style (e.g., dashed)
  final Color? decorationColor; // Decoration color
  final double? decorationThickness; // Decoration thickness
  final bool? softWrap; // Whether to wrap text
  final TextDirection? textDirection; // Text direction (e.g., RTL)
  final Locale? locale; // Locale for the text
  final StrutStyle? strutStyle; // Strut style for vertical alignment
  final double? height; // Line height
  final bool? applyHeightToFirstAscent; // Apply height to first ascent
  final bool? applyHeightToLastDescent; // Apply height to last descent
  const CustomText({
    Key? key,
    required this.text,
    this. subTitle,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.height,
    this.applyHeightToFirstAscent,
    this.applyHeightToLastDescent,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: color ?? Colors.black, // Default text color
            fontSize: fontSize ?? 16, // Default font size
            fontWeight: fontWeight ?? FontWeight.normal, // Default font weight
            fontFamily: fontFamily, // Custom font family
            letterSpacing: letterSpacing, // Letter spacing
            wordSpacing: wordSpacing, // Word spacing
            decoration: decoration, // Text decoration
            decorationColor: decorationColor, // Decoration color
            decorationStyle: decorationStyle, // Decoration style
            decorationThickness: decorationThickness, // Decoration thickness
            height: height, // Line height
          ),
      textAlign: textAlign ?? TextAlign.start, // Default text alignment
      maxLines: maxLines, // Maximum number of lines
      overflow: overflow ?? TextOverflow.ellipsis, // Default overflow behavior
      softWrap: softWrap ?? true, // Default soft wrap behavior
      textDirection: textDirection, // Text direction
      locale: locale, // Locale
      strutStyle: strutStyle, // Strut style
    );
  }
}
