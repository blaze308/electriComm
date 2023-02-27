import 'package:electricomm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeText {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  LargeText(
      {Key? key,
      this.color,
      required this.size,
      required this.overflow,
      required this.text})
      : super();

  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: GoogleFonts.ubuntu(
        color: mainTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 90,
      ),
    );
  }
}

class SmallText {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  SmallText(
      {Key? key,
      this.color,
      required this.size,
      required this.overflow,
      required this.text})
      : super();

  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: GoogleFonts.ubuntu(
        color: mainTextColor,
        fontWeight: FontWeight.w100,
        fontSize: 90,
      ),
    );
  }
}
