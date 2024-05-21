import 'package:flutter/material.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/statics.dart';

class CustomTextAppBar extends StatelessWidget {
  const CustomTextAppBar({
    super.key,
    required this.title,
  });
  final String title;
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
              children: [
                GestureDetector(
                  onTap: () {
                    navigatePop(context: context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: AppStyles.primaryG2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppStyles.primaryBl3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: AppStyles.customTextStyleBl4
                      .copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
