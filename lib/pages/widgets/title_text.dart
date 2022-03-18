import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_shop/themes/colors.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = LightColor.titleTextColor,
      this.fontWeight = FontWeight.w800})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.mulish(
      fontSize:  fontSize,
      fontWeight:  fontWeight,
      color:  color
    ),);
  }
}
