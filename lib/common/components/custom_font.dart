import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFjalOne extends StatefulWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign alignment;
  const FontFjalOne({
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
    required this.alignment,
    super.key,
  });

  @override
  State<FontFjalOne> createState() => _FontFjalOneState();
}

class _FontFjalOneState extends State<FontFjalOne> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.fjallaOne(
        fontSize: widget.size,
        fontWeight: widget.fontWeight,
        color: widget.color,
      ),
      textAlign: widget.alignment,
    );
  }
}

class FontPoppins extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign alignment;
  final TextOverflow? textOverflow;
  const FontPoppins({
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
    required this.alignment,
    this.textOverflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: alignment,
      overflow: textOverflow,
    );
  }
}
