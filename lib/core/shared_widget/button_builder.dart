import 'package:flutter/material.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/statics.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    super.key,
    required this.text,
    required this.ontap,
    this.width,
    this.height,
    this.color,
    this.textColor,
  });

  final String text;
  final VoidCallback ontap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Center(
        child: Container(
          width: width ?? double.infinity,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color ?? AppStyles.primaryB2),
            color: color ?? AppStyles.primaryB2,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontFamily: CacheService.getData(key: ConstText().isArabic)
                    ? 'Din'
                    : 'Manrope',
                fontWeight: FontWeight.w700,
                color: textColor ?? AppStyles.primaryW2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonBuilderWithIcon extends StatelessWidget {
  const ButtonBuilderWithIcon({
    super.key,
    required this.text,
    required this.ontap,
    this.width,
    this.height,
    this.color,
    this.textColor,
    required this.widget,
    this.borderColor,
  });

  final String text;
  final VoidCallback ontap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final IconData widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Center(
        child: Container(
          width: width ?? double.infinity,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor ?? AppStyles.primaryB2),
            color: color ?? AppStyles.primaryB2,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget,
                  color: textColor ?? AppStyles.primaryW2,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: CacheService.getData(key: ConstText().isArabic)
                        ? 'Din'
                        : 'Manrope',
                    color: textColor ?? AppStyles.primaryW2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
