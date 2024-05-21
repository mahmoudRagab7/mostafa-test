import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nfc_card/core/statics.dart';
import 'package:nfc_card/features/home/home_view.dart';
import 'package:nfc_card/features/setting/setting_view.dart';
import 'package:nfc_card/features/share/share_view.dart';
import 'package:nfc_card/generated/l10n.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var language = S.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Column(
        children: [
          const Expanded(
            child: TabBarView(
              children: [
                HomeView(),
                ShareView(),
                SettingView(),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              labelColor: AppStyles.primaryB2,
              unselectedLabelColor: AppStyles.primaryG,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_rounded,
                    ),
                    Text(
                      language.account,
                      style: selectedIndex == 0
                          ? AppStyles.customTextStyleB2
                          : AppStyles.customTextStyleBl3,
                    )
                  ],
                )),
                Tab(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.scan_barcode),
                    Text(
                      language.share,
                      style: selectedIndex == 1
                          ? AppStyles.customTextStyleB2
                          : AppStyles.customTextStyleBl3,
                    )
                  ],
                )),
                Tab(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Iconsax.setting_2),
                    Text(
                      language.settings,
                      style: selectedIndex == 2
                          ? AppStyles.customTextStyleB2
                          : AppStyles.customTextStyleBl3,
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
