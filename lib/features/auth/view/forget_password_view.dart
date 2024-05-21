import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/auth/cubit/auth_cubit.dart';
import 'package:nfc_card/features/auth/view/otp_forget_view.dart';
import 'package:nfc_card/generated/l10n.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey();

  

  @override
  Widget build(BuildContext context) {
    final sW = MediaQuery.of(context).size.width;
    final language = S.of(context);
    final authCubit = AuthCubit.get(context);

    return Scaffold(
      // extendBody: true,
      backgroundColor: CacheService.getData(key: ConstText().isDark)
          ? AppStyles.primaryB
          : AppStyles.primaryW,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            forgetTopPart(sW),
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
                        language.recoveryPassword,
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          language.enterPhoneNo,
                          textAlign: TextAlign.center,
                          style: AppStyles.customTextStyleG3,
                        ),
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
                            IntlPhoneField(
                              // disableLengthCheck: true,
                              invalidNumberMessage: language.phoneVal,
                              initialCountryCode: 'SA',
                              languageCode: CacheService.getData(
                                      key: ConstText().isArabic)
                                  ? 'ar'
                                  : 'en',
                              validator: (phone) {
                                if (phone == null || phone.number.isEmpty) {
                                  return 'Please enter a phone number';
                                }
                                // You can add more custom validation here if needed.
                                return null;
                              },
                              onChanged: (value) {
                                authCubit.countryCode = value.countryCode;
                              },
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
                              height: 16,
                            ),
                            // login button
                            Center(
                              child: ButtonBuilder(
                                text: language.endOTP,
                                ontap: () {
                                  // getPhoneNumber(controller.text);
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OTPForgetView(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),
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

  SliverAppBar forgetTopPart(double sW) {
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
      expandedHeight: 230.0,
      floating: false,
      pinned: false,
      snap: false,
      stretch: true,
    );
  }
}
