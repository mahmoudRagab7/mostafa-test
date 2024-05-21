import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/services/validation_service.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/auth/cubit/auth_cubit.dart';
import 'package:nfc_card/features/auth/view/forget_password_view.dart';
import 'package:nfc_card/features/auth/view/register_view.dart';
import 'package:nfc_card/features/layout/bottom_tab_bar.dart';
import 'package:nfc_card/generated/l10n.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool _isChecked = false;
  bool showPassword = true;
  onpressed() {
    setState(
      () {
        showPassword = !showPassword;
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
            loginTopPart(sW),
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
                        language.welcome,
                        style: AppStyles.customTextStyleBl,
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
                              label: language.username,
                              prefix: SizedBox(
                                width: 24,
                                height: 24,
                                child: CacheService.getData(
                                        key: ConstText().isDark)
                                    ? SvgPicture.asset('assets/user.svg')
                                    : SvgPicture.asset('assets/user2.svg'),
                              ),
                              controller: authCubit.usernameController,
                              type: TextInputType.text,
                              width: sW,
                              isPAdding: true,
                              validator: (value) {
                                return ValidationService()
                                    .validateEmailAndPhone(value, context);
                              },
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
                                  //     : SvgPicture.asset('assets/lock2.svg'),
                                  ),
                              controller: authCubit.passwordController,
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
                              height: 4,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: AppStyles.primaryB3,
                                  value: _isChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _isChecked = newValue!;
                                    });
                                  },
                                ),
                                Text(
                                  language.rememberMe,
                                  style: AppStyles.customTextStyleBl2,
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgetPasswordView()));
                                  },
                                  child: Text(
                                    language.forgetPassword,
                                    style: AppStyles.customTextStyleB,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 26,
                            ),
                            // login button
                            Center(
                              child: ButtonBuilder(
                                text: language.login,
                                ontap: () {
                                  // if (formKey.currentState!.validate()) {
                                  navigateAndReplace(
                                    context: context,
                                    screen: const BottomTabBar(),
                                  );
                                  // }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: ButtonBuilder(
                                text: language.createAccount,
                                color: AppStyles.primaryB4,
                                textColor: AppStyles.primaryB3,
                                ontap: () {
                                  navigateTo(
                                    context: context,
                                    screen: const RegisterView(),
                                  );
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

  SliverAppBar loginTopPart(double sW) {
    return SliverAppBar(
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
              )
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
