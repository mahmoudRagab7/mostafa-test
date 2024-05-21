import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/services/validation_service.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/auth/cubit/auth_cubit.dart';
import 'package:nfc_card/features/auth/view/otp_register_view.dart';
import 'package:nfc_card/features/terms_and_condition/terms_and_condition_view.dart';
import 'package:nfc_card/generated/l10n.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool showPassword = true;
  bool showRePassword = true;
  onpressed() {
    setState(
      () {
        showPassword = !showPassword;
      },
    );
  }

  onRepressed() {
    setState(
      () {
        showRePassword = !showRePassword;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sW = MediaQuery.of(context).size.width;
    final language = S.of(context);
    final authCubit = AuthCubit.get(context);

    return Scaffold(
      // extendBody: true,
      // resizeToAvoidBottomInset: false,
      backgroundColor: CacheService.getData(key: ConstText().isDark)
          ? AppStyles.primaryB
          : AppStyles.primaryW,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            signUpTopPart(sW),
          ];
        },
        body: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // welcome text
                      Text(
                        language.createNewAccount,
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            language.whenSignUp,
                            style: AppStyles.customTextStyleG3,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              navigateTo(
                                context: context,
                                screen: const TermsAndConditionView(),
                              );
                            },
                            child: Text(
                              language.termsAndCondition,
                              style: AppStyles.customTextStyleB,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // auth
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // username text field
                            TextFormFieldBuilder(
                              label: language.name,
                              prefix: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CacheService.getData(
                                          key: ConstText().isDark)
                                      ? SvgPicture.asset('assets/user.svg')
                                      : SvgPicture.asset('assets/user2.svg')),
                              controller: authCubit.nameController,
                              type: TextInputType.text,
                              width: sW,
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
                              languageCode: CacheService.getData(
                                      key: ConstText().isArabic)
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
                              controller: authCubit.phoneController,
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
                              height: 12,
                            ),
                            // password text field
                            TextFormFieldBuilder(
                              label: language.password,
                              obsecure: showPassword,
                              prefix: const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    Iconsax.lock5,
                                    color: AppStyles.primaryG,
                                  )
                                  // CacheService.getData(
                                  //         key: ConstText().isDark)
                                  //     ? SvgPicture.asset('assets/lock.svg')
                                  //     : SvgPicture.asset('assets/lock2.svg')
                                  ),
                              controller: authCubit.passwordReController,
                              suffix: IconButton(
                                onPressed: () {
                                  onpressed();
                                },
                                icon: showPassword
                                    ? const Icon(Iconsax.eye)
                                    : const Icon(Iconsax.eye_slash),
                              ),
                              type: TextInputType.text,
                              width: sW,
                              isPAdding: true,
                              validator: (value) {
                                return ValidationService()
                                    .validatePassword(value, context);
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            // repassword text field
                            TextFormFieldBuilder(
                              label: language.rePassword,
                              obsecure: showRePassword,
                              prefix: const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    Iconsax.lock5,
                                    color: AppStyles.primaryG,
                                  )
                                  // CacheService.getData(
                                  //         key: ConstText().isDark)
                                  //     ? SvgPicture.asset('assets/lock.svg')
                                  //     : SvgPicture.asset('assets/lock2.svg')
                                  ),
                              controller: authCubit.repasswordReController,
                              suffix: IconButton(
                                onPressed: () {
                                  onRepressed();
                                },
                                icon: showRePassword
                                    ? const Icon(Iconsax.eye)
                                    : const Icon(Iconsax.eye_slash),
                              ),
                              type: TextInputType.text,
                              width: sW,
                              isPAdding: true,
                              validator: (value) {
                                return ValidationService().validateRePassword(
                                    value,
                                    context,
                                    authCubit.passwordReController.text
                                        .toString());
                              },
                            ),

                            const SizedBox(
                              height: 26,
                            ),
                            // login button
                            Center(
                              child: ButtonBuilder(
                                text: language.createAccount,
                                ontap: () {
                                  // getPhoneNumber(controller.text);
                                  // if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OTPRegisterView(),
                                    ),
                                  );
                                  // }
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              language.orSignInWith,
                              style: AppStyles.customTextStyleG2,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                signWithContainer('assets/google_icon.png'),
                                signWithContainer('assets/facebook.png'),
                                signWithContainer('assets/twitter_x.png'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container signWithContainer(String image) {
    return Container(
      width: 106,
      height: 52,
      decoration: ShapeDecoration(
          color: AppStyles.primaryW3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          image: DecorationImage(image: AssetImage(image))),
    );
  }

  SliverAppBar signUpTopPart(double sW) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppStyles.primaryB2,
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 280,
                decoration: const BoxDecoration(
                  color: AppStyles.primaryB2,
                  image: DecorationImage(
                    image: AssetImage('assets/circuit-board 2.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 161.33,
                      height: 118.67,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: SvgPicture.asset('assets/toqlogo.svg'),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                child: Opacity(
                  opacity: 0.50,
                  child: Container(
                    width: sW * 0.94,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: CacheService.getData(key: ConstText().isDark)
                          ? AppStyles.primaryB
                          : AppStyles.primaryW,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: sW,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: CacheService.getData(key: ConstText().isDark)
                        ? AppStyles.primaryB
                        : AppStyles.primaryW,
                    shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        side: BorderSide(
                            color: CacheService.getData(key: ConstText().isDark)
                                ? AppStyles.primaryB
                                : AppStyles.primaryW)),
                  ),
                ),
              ),
              Positioned(
                  right: 16,
                  top: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.20000000298023224),
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
                              color: AppStyles.primaryW,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        stretchModes: const [StretchMode.zoomBackground],
      ),
      expandedHeight: 200.0,
      floating: false,
      pinned: false,
      snap: false,
      stretch: true,
    );
  }
}
