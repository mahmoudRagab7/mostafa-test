import 'package:flutter/material.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';

class AppStyles {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const AppStyles({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });
  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle customTextStyleB = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryB3,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleB2 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryB3,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleB3 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryB5,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleB4 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppStyles.primaryB5,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleB5 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppStyles.primaryB2,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl3 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl4 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl5 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppStyles.primaryBl2,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl6 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: AppStyles.primaryBl2,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl7 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl8 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleBl9 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: AppStyles.primaryBl,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryG,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG2 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryG2,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG3 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryG3,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG4 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryG,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG5 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppStyles.primaryG6,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG6 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryG7,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );
  static TextStyle customTextStyleG7 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppStyles.primaryG8,
    fontFamily:
        CacheService.getData(key: ConstText().isArabic) ? 'Din' : 'Manrope',
  );

  static const Color primaryB = Color(0xFF0B111C);
  static const Color primaryB2 = Color(0xFF167BD8);
  static const Color primaryB3 = Color(0xFF167AD8);
  static const Color primaryB4 = Color(0xFFE8F3FD);
  static const Color primaryB5 = Color(0xFF001D42);

  static const Color primaryBl = Color(0xFF191919);
  static const Color primaryBl2 = Color(0xFF333333);
  static const Color primaryBl3 = Color(0xFF1A1A1A);

  static const Color primaryG = Color(0xFF999999);
  static const Color primaryG2 = Color(0xFFCCCCCC);
  static const Color primaryG3 = Color(0xFF979797);
  static const Color primaryG4 = Color(0xFFF7F7F7);
  static const Color primaryG5 = Color(0xFFE6E6E6);
  static const Color primaryG6 = Color(0xFF666666);
  static const Color primaryG7 = Color(0xFF757575);
  static const Color primaryG8 = Color(0xFF212121);

  static const Color primaryW = Color(0xFFFFFFFF);
  static const Color primaryW2 = Color(0xFFF2F3F3);
  static const Color primaryW3 = Color(0xFFF2F2F2);

  static const Color primaryR = Color(0xFFCC4545);

  static const Color primaryGR = Color(0xFF60D669);

  static const Color primaryO = Color(0xFFF79824);
}
