import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/services/navigation_services.dart';
import 'package:nfc_card/core/shared_widget/button_builder.dart';
import 'package:nfc_card/core/shared_widget/custom_app_bar.dart';
import 'package:nfc_card/core/shared_widget/profile_row.dart';
import 'package:nfc_card/core/shared_widget/text_form_field_builder.dart';
import 'package:nfc_card/core/shared_widget/toq_card_container.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/add_link/add_link_view.dart';
import 'package:nfc_card/features/home/widgets/qr_scan.dart';
import 'package:nfc_card/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> linksList = [
    {
      "image": "assets/googleplay_link.png",
      "url": "https://play.google.com/store/games?hl=en&gl=US",
      "name": "google play",
      "isToggled": false
    },
    {
      "image": "assets/apple_link.png",
      "url": "https://www.apple.com/eg/",
      "name": "apple app",
      "isToggled": false
    },
    {
      "image": "assets/instagram_link.png",
      "url": "https://www.instagram.com/",
      "name": "instagram",
      "isToggled": false
    },
    {
      "image": "assets/linkedin_link.png",
      "url": "https://www.linkedin.com/feed/?trk=onboarding-landing",
      "name": "linkedin",
      "isToggled": false
    },
  ];
  @override
  Widget build(BuildContext context) {
    var language = S.of(context);

    return Scaffold(
      backgroundColor: AppStyles.primaryW3,
      body: Column(
        children: [
          const CustomAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppStyles.primaryW,
                      borderRadius: BorderRadius.circular(16)),
                  child: const ProfileRow(),
                ),
                buttonRow(language, context, () {
                  navigateAndReplace(
                    context: context,
                    screen: const AddLinkView(),
                  );
                }, () {
                  activateDialog(context, language);
                }),
                Container(
                  decoration: BoxDecoration(
                      color: AppStyles.primaryW,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              language.myLinks,
                              style: AppStyles.customTextStyleBl4,
                            ),
                            Text(
                              '(${linksList.length} ${language.links})',
                              style: AppStyles.customTextStyleBl4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.42,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  linksContainer(linksList[index]['name'],
                                      linksList[index]['isToggled'], index, () {
                                    urlDetailsDialog(context, language, index);
                                  }, linksList[index]['image']),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              );
                            },
                            itemCount: linksList.length,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future activateWithNFCDialog(
    BuildContext context,
    S language,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.47,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    language.readyToActivate,
                    style: AppStyles.customTextStyleBl4,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ToqCardContainer(
                    isDark: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    language.putCard,
                    style: AppStyles.customTextStyleG4,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ButtonBuilder(
                      width: MediaQuery.of(context).size.width * 0.94,
                      text: language.cancel,
                      // color: AppStyles.primaryW3,
                      // textColor: AppStyles.primaryBl3,
                      ontap: () {
                        navigatePop(context: context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future activateDialog(
    BuildContext context,
    S language,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.68,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "${language.activate} Business Card",
                    style: AppStyles.customTextStyleBl4,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ToqCardContainer(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    language.selectActivation,
                    style: AppStyles.customTextStyleG4,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  activateByContainer(
                    'assets/mirroring-screen.svg',
                    '${language.activateBy} NFC',
                    language.putCard,
                    () {
                      navigatePop(context: context);
                      activateWithNFCDialog(context, language);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  activateByContainer(
                    'assets/scan-barcode.svg',
                    '${language.activateBy} ${language.qr}',
                    language.putqr,
                    () {
                      navigatePop(context: context);
                      navigateTo(context: context, screen: const QRScan());
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonBuilder(
                      width: MediaQuery.of(context).size.width * 0.94,
                      text: language.cancel,
                      color: AppStyles.primaryW3,
                      textColor: AppStyles.primaryBl3,
                      ontap: () {
                        navigatePop(context: context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector activateByContainer(
      String image, String title, String use, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.94,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppStyles.primaryG2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: SvgPicture.asset(image),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.customTextStyleBl7,
                ),
                const SizedBox(height: 8),
                Text(
                  use,
                  textAlign: TextAlign.center,
                  style: AppStyles.customTextStyleG4,
                ),
              ],
            ),
            const Spacer(),
            const SizedBox(
              width: 20,
              height: 20,
              child: Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }

  Future urlDetailsDialog(BuildContext context, S language, index) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage(linksList[index]['image']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      linksList[index]['name'],
                      style: AppStyles.customTextStyleBl5,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    language.urlApp,
                    style: AppStyles.customTextStyleBl4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormFieldBuilder(
                      label: linksList[index]['name'],
                      controller: TextEditingController(),
                      type: TextInputType.name,
                      isPAdding: false),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${linksList[index]['name']} URL',
                    style: AppStyles.customTextStyleBl4,
                  ),
                  TextFormFieldBuilder(
                      label: linksList[index]['url'],
                      controller: TextEditingController(),
                      type: TextInputType.url,
                      isPAdding: false),
                  const SizedBox(
                    height: 12,
                  ),
                  ButtonBuilder(
                      text: language.deleteUrl,
                      color: AppStyles.primaryR,
                      ontap: () {
                        navigatePop(context: context);
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonBuilder(
                          width: MediaQuery.of(context).size.width * 0.42,
                          text: language.saveEdit,
                          color: AppStyles.primaryG4,
                          textColor: AppStyles.primaryG2,
                          ontap: () {
                            navigatePop(context: context);
                          }),
                      ButtonBuilder(
                          width: MediaQuery.of(context).size.width * 0.42,
                          text: language.cancel,
                          color: AppStyles.primaryW3,
                          textColor: AppStyles.primaryBl3,
                          ontap: () {
                            navigatePop(context: context);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector linksContainer(String name, bool isTrue, int index,
      void Function() onTap, String image) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: AppStyles.primaryG4,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: AssetImage(image))),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: AppStyles.customTextStyleB3,
              ),
              const Spacer(),
              isTrue
                  ? GestureDetector(
                      onTap: () {
                        linksList[index]["isToggled"] = !isTrue;
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
                        linksList[index]["isToggled"] = !isTrue;
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
        ),
      ),
    );
  }

  Padding buttonRow(S language, BuildContext context, void Function() ontap,
      void Function() ontap2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBuilderWithIcon(
            text: language.addLink,
            ontap: ontap,
            widget: Iconsax.add,
            width: MediaQuery.of(context).size.width * 0.44,
          ),
          ButtonBuilderWithIcon(
            borderColor: AppStyles.primaryB3,
            text: language.activateCard,
            textColor: AppStyles.primaryB3,
            color: Colors.transparent,
            ontap: ontap2,
            widget: Iconsax.flash_1,
            width: MediaQuery.of(context).size.width * 0.44,
          ),
        ],
      ),
    );
  }
}
