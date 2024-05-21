import 'package:flutter/material.dart';

import 'package:nfc_card/core/statics.dart';

class TextFormFieldBuilder extends StatelessWidget {
  const TextFormFieldBuilder({
    super.key,
    required this.label,
    this.onchanged,
    required this.controller,
    required this.type,
    this.width,
    this.suffix,
    this.onpressed,
    this.obsecure = false,
    this.color,
    this.validator,
    this.prefix,
    required this.isPAdding,
    this.maxLines = 1,
  });

  final String label;
  final Function(String)? onchanged;
  final bool? obsecure;
  final Function? onpressed;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final TextInputType? type;
  final double? width;
  final Color? color;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool isPAdding;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: screenHeight * 0.09,
      child: TextFormField(
        controller: controller,
        obscureText: obsecure!,
        style: const TextStyle(
          color:
              // CacheService.getData(key: ConstText().isDark)
              //     ? AppStyles.primaryW
              //     :
              AppStyles.primaryB,
        ),
        validator: validator,
        onChanged: onchanged,
        maxLines: maxLines,
        keyboardType: type,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          filled: true,
          fillColor: Colors.transparent,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: suffix,
          ),
          prefixIcon: isPAdding
              ? Padding(
                  padding:
                      // CacheService.getData(key: ConstText().isArabic)
                      //     ? const EdgeInsets.only(
                      //         right: 4, top: 8, bottom: 8, left: 16)
                      //     :
                      const EdgeInsets.only(
                          right: 16, top: 8, bottom: 8, left: 4),
                  child: prefix,
                )
              : prefix,
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppStyles.primaryB2,
              width: 2.0,
            ),
          ),
          labelStyle:
              // CacheService.getData(key: ConstText().isDark)
              //     ? AppStyles.customTextStyleG2
              //     :
              AppStyles.customTextStyleG,
        ),
      ),
    );
  }
}
