import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/custom_app_bar.dart';
import 'package:nfc_card/core/shared_widget/profile_row.dart';
import 'package:nfc_card/core/shared_widget/toq_card_container.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/about_app/about_app_view.dart';
import 'package:nfc_card/features/preview/preview_view.dart';
import 'package:nfc_card/features/set_up_account/set_up_account_view.dart';
import 'package:nfc_card/features/terms_and_condition/terms_and_condition_view.dart';
import 'package:nfc_card/generated/l10n.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    var language = S.of(context);

    return Scaffold(
      backgroundColor: AppStyles.primaryW3,
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppStyles.primaryW,
                          borderRadius: BorderRadius.circular(16)),
                      child: const ProfileRow(),
                    ),
                    personalCardContainer(language, context),
                    settingRow(
                        icon: Iconsax.setting_2,
                        name: language.setUpAccount,
                        onTap: () {
                          navigateTo(
                            context: context,
                            screen: const SetUpAccountView(),
                          );
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      // padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          settingRow(
                              icon: Iconsax.judge,
                              name: language.termsAndCondition,
                              onTap: () {
                                navigateTo(
                                  context: context,
                                  screen: const TermsAndConditionView(),
                                );
                              }),
                          settingRow(
                              icon: Iconsax.warning_2,
                              name: language.aboutApp,
                              onTap: () {navigateTo(
                                  context: context,
                                  screen: const AboutAppView(),
                                );}),
                          settingRow(
                              icon: Iconsax.star,
                              name: language.rateApp,
                              iconColor: AppStyles.primaryO,
                              onTap: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector settingRow({
    required IconData icon,
    required String name,
    required void Function() onTap,
    Color iconColor = AppStyles.primaryB2,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: AppStyles.primaryW3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: AppStyles.customTextStyleBl6,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppStyles.primaryB2,
            )
          ],
        ),
      ),
    );
  }

  Padding personalCardContainer(S language, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              language.personalCard,
              style: AppStyles.customTextStyleBl6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: ToqCardContainer(
                  width: 230,
                  height: 145,
                ),
              ),
            ),
            buttonRow(
              language,
              context,
              () {
                navigateTo(context: context, screen: const PreviewView());
              },
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Padding buttonRow(S language, BuildContext context, void Function() ontap,
      void Function() ontap2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBuilderWithIcon(
            text: language.preview,
            ontap: ontap,
            widget: Iconsax.eye,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 64,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    language.activateProduct,
                    style: AppStyles.customTextStyleBl4,
                  ),
                  const Spacer(),
                  isTrue
                      ? GestureDetector(
                          onTap: () {
                            isTrue = !isTrue;
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.toggle_off,
                            size: 40,
                            color: AppStyles.primaryB3,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            isTrue = !isTrue;
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.toggle_on_outlined,
                            size: 40,
                            color: AppStyles.primaryG,
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
