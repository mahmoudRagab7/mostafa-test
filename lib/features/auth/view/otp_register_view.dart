import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/auth/cubit/auth_cubit.dart';
import 'package:nfc_card/features/layout/bottom_tab_bar.dart';
import 'package:nfc_card/generated/l10n.dart';

class OTPRegisterView extends StatefulWidget {
  const OTPRegisterView({super.key});

  @override
  State<OTPRegisterView> createState() => _OTPRegisterViewState();
}

class _OTPRegisterViewState extends State<OTPRegisterView> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = true;
  TextEditingController codeController1 = TextEditingController();
  TextEditingController codeController2 = TextEditingController();
  TextEditingController codeController3 = TextEditingController();
  TextEditingController codeController4 = TextEditingController();
  TextEditingController codeController5 = TextEditingController();
  bool invalidOTP = false;
  int resendTime = 60;
  late Timer countDownTimer;
  onpressed() {
    setState(
      () {
        showPassword = !showPassword;
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countDownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            resendTime = resendTime - 1;
          },
        );
        if (resendTime < 1) {
          countDownTimer.cancel();
        }
      },
    );
  }

  stopTimer() {
    if (countDownTimer.isActive) {
      countDownTimer.cancel();
    }
  }

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
            otpRegisterTopPart(sW),
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
                        language.aboutToFinish,
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          language.checkOTP,
                          textAlign: TextAlign.center,
                          style: AppStyles.customTextStyleG3,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                authCubit.countryCode! +
                                    authCubit.phoneController.text.toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color(0xFF191919),
                                  fontSize: 18,
                                  fontFamily: 'Din',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // auth
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // username text field
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  textPin(context, codeController1),
                                  textPin(context, codeController2),
                                  textPin(context, codeController3),
                                  textPin(context, codeController4),
                                  textPin(context, codeController5)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            // login button
                            Center(
                              child: ButtonBuilder(
                                text: language.confirm,
                                ontap: () {
                                  // if (formKey.currentState!.validate()) {
                                  //   final int otp = int.parse(
                                  //     codeController1.text +
                                  //         codeController2.text +
                                  //         codeController3.text +
                                  //         codeController4.text +
                                  //         codeController5.text,
                                  //   );
                                  //   if (otp == 55555) {
                                  creationSuccessDialog(context, language);
                                  //   }
                                  // }
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  language.resendAfter,
                                  style: AppStyles.customTextStyleG,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '00:${resendTime.toString()}',
                                  style: AppStyles.customTextStyleB,
                                ),
                                const Spacer(),
                                resendTime == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          invalidOTP = false;
                                          resendTime = 60;
                                          print('ffffffffffffffffffffffffff');
                                          startTimer();
                                        },
                                        child: Text(
                                          language.resend,
                                          style: AppStyles.customTextStyleB,
                                        ),
                                      )
                                    : Text(
                                        language.resend,
                                        style: AppStyles.customTextStyleG,
                                      ),
                              ],
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

  Future creationSuccessDialog(BuildContext context, S language) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: 390,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  language.accountCreation,
                  style: AppStyles.customTextStyleBl,
                ),
                const SizedBox(height: 20),
                ButtonBuilder(
                    text: language.start,
                    ontap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomTabBar(),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      },
    );
  }

  Widget textPin(context, TextEditingController controller) {
    return SizedBox(
      height: 50,
      width: 52,
      child: TextFormField(
        onSaved: (pin) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Required';
          }
          return null;
        },
        showCursor: false,
        enableSuggestions: false,
        controller: controller,
        autocorrect: false,
        maxLength: 1,
        autofocus: true,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: AppStyles.primaryB3),
          ),
          focusColor: AppStyles.primaryB3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: AppStyles.primaryB3),
          ),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  SliverAppBar otpRegisterTopPart(double sW) {
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
