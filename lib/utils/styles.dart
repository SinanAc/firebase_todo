import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  // ===>>> COLORS
  static const Color bgColor = Color(0xFFe2e2ef);
  static const Color mainColor = Color(0xFF000633);
  static const Color accentColor = Color(0xFF0065FF);
  static List<Color> cardColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  // ===>>> HEIGHT SPACES
  static const appHeight_10 = SizedBox(height: 10);
  static const appHeight_15 = SizedBox(height: 15);
  static const appHeight_20 = SizedBox(height: 20);

  // ===>>> WIDTH SPACES
  static const appWidth_10 = SizedBox(width: 10);
  static const appWidth_15 = SizedBox(width: 15);
  static const appWidth_20 = SizedBox(width: 20);

  // ===>>> TEXT STYLES
  static TextStyle appTitleStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainTitleStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentStyle = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );
  
  static TextStyle dateTitleStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
}
