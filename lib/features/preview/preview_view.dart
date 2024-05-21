import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/custom_text_app_bar.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/generated/l10n.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    var language = S.of(context);
    return Scaffold(
      backgroundColor: AppStyles.primaryW3,
      body: Column(
        children: [
          CustomTextAppBar(title: language.preview),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    photosStack(),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      'أحمد مبروك',
                      style: AppStyles.customTextStyleB5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'UX UI Designer',
                        textAlign: TextAlign.center,
                        style: AppStyles.customTextStyleBl4,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "40-year Silicon Valley mentor, author, and product veteran including 6 startups",
                        style: AppStyles.customTextStyleG5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconContainer(Iconsax.call_calling),
                          iconContainer(Iconsax.sms),
                          iconContainer(Iconsax.global),
                          iconContainer(Iconsax.link),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ButtonBuilder(text: 'Save Contact', ontap: () {}),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 24,
                        right: 24,
                        bottom: 32,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEEEEEE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Column(
                          children: [
                            Text(
                              'Let\'s keep in touch always',
                              textAlign: TextAlign.center,
                              style: AppStyles.customTextStyleG6,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 102,
                                    child: Image.asset('assets/linkedIN.png'),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 102,
                                    child: Image.asset('assets/whatsapp.png'),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 102,
                                    child: Image.asset('assets/facebook1.png'),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 102,
                                  child: Image.asset('assets/google play.png'),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 102,
                                  child: Image.asset('assets/apple app.png'),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 102,
                                  child: Image.asset('assets/instagram.png'),
                                ),
                              ],
                            )
                          ],
                        ),
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

  Container iconContainer(IconData icon) {
    return Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppStyles.primaryW3),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Icon(icon),
    );
  }

  SizedBox photosStack() {
    return SizedBox(
      height: 165,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 166,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/profile.jpeg'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFFCFCFC),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
