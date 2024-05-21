import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nfc_card/core/statics.dart';

class ToqCardContainer extends StatelessWidget {
  const ToqCardContainer(
      {super.key, this.isDark = true, this.width = 285, this.height = 180});
  final bool isDark;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: isDark
              ? ShapeDecoration(
                  color: const Color(0xFF222222),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                )
              : ShapeDecoration(
                  color: AppStyles.primaryG2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 47.5, horizontal: 35),
            child: SizedBox(
              width: 115,
              height: 85,
              child: SvgPicture.asset(
                'assets/toqlogo.svg',
                width: 115,
                height: 85,
              ),
            ),
          ),
        ),
        Positioned(
            top: 15,
            right: 22,
            child: SizedBox(
                width: 15,
                height: 20,
                child: SvgPicture.asset("assets/Contactless Icon.svg")))
      ],
    );
  }
}
