import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ingogo/resources/colors.dart';

class TextStyles {
  TextStyles._();

  //Medium size styles
  static final mediumDarkStyle1 = regular16pt.copyWith(color:  Colors.grey);
  static final appBarTitleStyle = semiBold16pt.copyWith(color: Colors.black);
  static final mediumLightStyle1 = medium16pt.copyWith(color:  Colors.white);
  static final mediumMainStyle = medium16pt.copyWith(color: AppColors.main, height: 1.4);
  //End medium size styles

  //Small size styles
  static final smallDarkStyle = regular12pt.copyWith(color: Colors.black);
  static final smallLightStyle = regular12pt.copyWith(color: Colors.white);
  //End small size styles

  static final medium16pt = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static final semiBold16pt = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static final regular16pt = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static final regular12pt = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}
