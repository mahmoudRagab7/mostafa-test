
import 'package:flutter/material.dart';
import 'package:nfc_card/core/statics.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyles.primaryW,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/TOQ Logo2.png'),
                Container(
                  width: 44,
                  height: 44,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1, color: Color(0xFFE6E6E6)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'EN',
                        style: AppStyles.customTextStyleBl4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
