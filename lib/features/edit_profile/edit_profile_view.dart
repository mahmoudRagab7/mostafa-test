import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/edit_profile/cubit/editprofile_cubit.dart';
import 'package:nfc_card/features/layout/bottom_tab_bar.dart';
import 'package:nfc_card/generated/l10n.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  bool emailBool = false;
  bool personalBool = false;
  bool phoneBool = false;
  @override
  Widget build(BuildContext context) {
    var language = S.of(context);
    var editCubit = EditProfileCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBar(context, language),
                const SizedBox(
                  height: 32,
                ),
                photosStack(),
                const SizedBox(
                  height: 60,
                ),
                leadingText(language.fullname),
                const SizedBox(
                  height: 8,
                ),
                TextFormFieldBuilder(
                    prefix: SizedBox(
                        width: 20,
                        height: 20,
                        child: CacheService.getData(key: ConstText().isDark)
                            ? SvgPicture.asset('assets/user.svg')
                            : SvgPicture.asset('assets/user2.svg')),
                    label: language.writeFullname,
                    controller: editCubit.fullnameController,
                    type: TextInputType.name,
                    isPAdding: true),
                const SizedBox(
                  height: 8,
                ),
                leadingText(language.username),
                const SizedBox(
                  height: 8,
                ),
                TextFormFieldBuilder(
                    prefix: SizedBox(
                        width: 20,
                        height: 20,
                        child: CacheService.getData(key: ConstText().isDark)
                            ? SvgPicture.asset('assets/user.svg')
                            : SvgPicture.asset('assets/user2.svg')),
                    label: language.writeUsername,
                    controller: editCubit.usernameController,
                    type: TextInputType.name,
                    isPAdding: true),
                const SizedBox(
                  height: 8,
                ),
                leadingText(language.job),
                const SizedBox(
                  height: 8,
                ),
                TextFormFieldBuilder(
                    prefix: SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(
                          Iconsax.personalcard,
                          color: AppStyles.primaryG,
                        )),
                    label: language.jobEx,
                    controller: editCubit.jobController,
                    type: TextInputType.name,
                    isPAdding: true),
                const SizedBox(
                  height: 8,
                ),
                leadingText(language.email),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormFieldBuilder(
                        width: MediaQuery.of(context).size.width * 0.8,
                        prefix: const Icon(
                          Iconsax.sms,
                          color: AppStyles.primaryG,
                        ),
                        label: 'example@domain.com',
                        controller: editCubit.emailController,
                        type: TextInputType.emailAddress,
                        isPAdding: true),
                    emailBool
                        ? GestureDetector(
                            onTap: () {
                              emailBool = !emailBool;
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
                              emailBool = !emailBool;
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
                const SizedBox(
                  height: 8,
                ),
                leadingText(language.personalLink),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormFieldBuilder(
                        width: MediaQuery.of(context).size.width * 0.8,
                        prefix: const Icon(
                          Iconsax.sms,
                          color: AppStyles.primaryG,
                        ),
                        label: 'ahmed.com',
                        controller: editCubit.urlController,
                        type: TextInputType.url,
                        isPAdding: true),
                    personalBool
                        ? GestureDetector(
                            onTap: () {
                              personalBool = !personalBool;
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
                              personalBool = !personalBool;
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
                const SizedBox(
                  height: 8,
                ),
                leadingText(language.phone),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: IntlPhoneField(
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
                        controller: editCubit.phoneController,
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
                    ),
                    phoneBool
                        ? GestureDetector(
                            onTap: () {
                              phoneBool = !phoneBool;
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
                              phoneBool = !phoneBool;
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
                const SizedBox(
                  height: 8,
                ),
                leadingText(language.writeAboutUrSelf),
                const SizedBox(
                  height: 8,
                ),
                TextFormFieldBuilder(
                    label: language.whatYouWantToSayAboutYourselfOrYourjob,
                    maxLines: 6,
                    controller: editCubit.descriptionController,
                    type: TextInputType.text,
                    isPAdding: false),
                const SizedBox(
                  height: 30,
                ),
                ButtonBuilder(
                    text: language.updatePersonalProfile,
                    ontap: () {
                      navigateAndReplace(
                          context: context, screen: const BottomTabBar());
                    })
              ],
            ),
          ),
        ),
      ),
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
            // width: 350,
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
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        color: AppStyles.primaryW,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(
                      Iconsax.gallery_edit,
                    )),
              )),
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
          Positioned(
              bottom: -35,
              // left: 150,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppStyles.primaryW,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(
                      Iconsax.gallery_edit,
                      size: 20,
                    )),
              )),
        ],
      ),
    );
  }

  Text leadingText(String text) {
    return Text(
      text,
      style: AppStyles.customTextStyleBl4,
    );
  }

  Row customAppBar(BuildContext context, S language) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            navigateAndReplace(context: context, screen: const BottomTabBar());
          },
          child: Container(
            width: 46,
            height: 46,
            decoration: ShapeDecoration(
              color: AppStyles.primaryG5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppStyles.primaryBl3,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          language.editProfile,
          style: AppStyles.customTextStyleBl4
              .copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
