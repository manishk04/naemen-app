import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeading extends StatelessWidget {
  const TextHeading({
    super.key,
    required this.title,
    required this.fontweight,
    required this.fontsize,
    required this.fontcolor,
  });

  final String title;
  final FontWeight fontweight;
  final double fontsize;
  final Color fontcolor;

  @override
  Widget build(BuildContext context) {
    return   Text(
      title,
      style: GoogleFonts.poppins(
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
    );
  }
}
