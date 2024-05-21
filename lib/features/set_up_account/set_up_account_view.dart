import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/custom_text_app_bar.dart';
import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/generated/l10n.dart';

class SetUpAccountView extends StatelessWidget {
  const SetUpAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    var language = S.of(context);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: AppStyles.primaryW3,
      body: Column(
        children: [
          CustomTextAppBar(title: language.setUpAccount),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      TextFormFieldBuilder(
                        label: language.name,
                        prefix: const SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(Icons.person_rounded),
                        ),
                        controller: nameController,
                        type: TextInputType.text,
                        // width: sW,
                        isPAdding: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "ادخل الاسم";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      IntlPhoneField(
                        // disableLengthCheck: false,
                        invalidNumberMessage: language.phoneVal,
                        initialCountryCode: 'SA',
                        languageCode:
                            CacheService.getData(key: ConstText().isArabic)
                                ? 'ar'
                                : 'en',
                        pickerDialogStyle: PickerDialogStyle(
                          padding: const EdgeInsets.all(16),
                          searchFieldInputDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: AppStyles.primaryB2,
                                width: 2.0,
                              ),
                            ),
                            label: const Text('اختر رقم الهاتف'),
                            labelStyle: AppStyles.customTextStyleG,
                          ),
                        ),
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppStyles.primaryB2,
                              width: 2.0,
                            ),
                          ),
                          label: const Text('رقم الهاتف'),
                          labelStyle: AppStyles.customTextStyleG,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ButtonBuilderWithIcon(
                        color: AppStyles.primaryR,
                        text: language.deleteAccount,
                        ontap: () {},
                        widget: Iconsax.trash,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                buttonRow(
                  language,
                  context,
                  () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buttonRow(
    S language,
    BuildContext context,
    void Function() ontap,
  ) {
    return Container(
      color: AppStyles.primaryW,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonBuilder(
                  width: MediaQuery.of(context).size.width * 0.43,
                  text: language.saveEdit,
                  color: AppStyles.primaryG4,
                  textColor: AppStyles.primaryG2,
                  ontap: () {
                    navigatePop(context: context);
                  }),
              ButtonBuilder(
                  width: MediaQuery.of(context).size.width * 0.43,
                  text: language.cancel,
                  color: AppStyles.primaryW3,
                  textColor: AppStyles.primaryBl3,
                  ontap: () {
                    navigatePop(context: context);
                  }),
            ],
          )),
    );
  }
}
