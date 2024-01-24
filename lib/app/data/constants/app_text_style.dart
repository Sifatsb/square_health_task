import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const styleFont32BlueW600 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const primaryTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static const secondaryTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static const authTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );

  static const secondaryAuthTextStyle = TextStyle(
    color: Color(0xFF8C88CD),
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
  );


}
