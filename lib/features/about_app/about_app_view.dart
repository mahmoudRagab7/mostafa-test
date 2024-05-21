import 'package:flutter/material.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/custom_text_app_bar.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/contact/contacts_alert.dart';
import 'package:nfc_card/generated/l10n.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    var language = S.of(context);

    return Scaffold(
      backgroundColor: AppStyles.primaryW3,
      body: Column(
        children: [
          CustomTextAppBar(title: language.aboutApp),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        language.whoAreWe,
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص",
                          style: AppStyles.customTextStyleBl8),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        language.contactUS,
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/global.png'),
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/logos_facebook.png'),
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/twitter_x.png'),
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/logos_telegram.png'),
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/logos_whatsapp-icon.png'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  color: AppStyles.primaryW,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ButtonBuilder(
                        text: language.shareLink,
                        ontap: () {
                          contactsAlert(context);
                          // navigatePop(context: context);
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
