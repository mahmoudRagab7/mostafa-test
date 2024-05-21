import 'package:flutter/material.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/generated/l10n.dart';

Future contactsAlert(context) {
  final lang = S.of(context);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          backgroundColor: CacheService.getData(key: ConstText().isDark)
              ? AppStyles.primaryB
              : AppStyles.primaryW,
          title: Text(
            lang.shareLinkBy,
            style: AppStyles.customTextStyleG7,
            textAlign: TextAlign.center,
          ),
          content: Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18, top: 18),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/logos_whatsapp-icon.png'),
                                fit: BoxFit.contain),
                          ),
                          width: 40,
                          height: 40,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/logos_telegram.png'),
                                  fit: BoxFit.contain)),
                          width: 40,
                          height: 40,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/facebook.png'),
                                  fit: BoxFit.contain)),
                          width: 40,
                          height: 40,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/link.png'),
                                  fit: BoxFit.contain)),
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBuilder(
                    text: lang.ok,
                    ontap: () {
                      navigatePop(context: context);
                    })
              ],
            )
          ],
        );
      });
}
