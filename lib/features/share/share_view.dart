import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nfc_card/core/shared_widget/custom_app_bar.dart';
import 'package:nfc_card/core/shared_widget/profile_row.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/generated/l10n.dart';

class ShareView extends StatefulWidget {
  const ShareView({super.key});

  @override
  State<ShareView> createState() => _ShareViewState();
}

class _ShareViewState extends State<ShareView> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    var language = S.of(context);
    return Scaffold(
      backgroundColor: AppStyles.primaryW3,
      body: Column(children: [
        const CustomAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  profileAndQrContainer(),
                  shareProfileContainer(language),
                  addToHomeContainer(language)
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Container addToHomeContainer(S language) {
    return Container(
      // width: 350,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Row(
        children: [
          Text(
            language.addToHome,
            style: AppStyles.customTextStyleB4,
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
    );
  }

  Padding shareProfileContainer(S language) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        // width: 350,
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                language.sharePersonalProfile,
                style: AppStyles.customTextStyleBl6,
              ),
              const SizedBox(
                height: 24,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logos_whatsapp-icon.png'),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logos_telegram.png'),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logos_messenger.png'),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/link.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  Container profileAndQrContainer() {
    return Container(
      // width: 350,
      height: 400,
      padding: const EdgeInsets.only(bottom: 24),
      decoration: ShapeDecoration(
        color: AppStyles.primaryW,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileRow(),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 245,
            width: 245,
            child: SvgPicture.asset('assets/qr.svg'),
          )
        ],
      ),
    );
  }
}
