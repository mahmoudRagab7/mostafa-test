import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/language_bloc/switch_language_bloc.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  if (CacheService.getData(key: ConstText().isArabic) == null) {
    CacheService.setData(
      key: ConstText().isArabic,
      value: true,
    );
  }
  if (CacheService.getData(key: ConstText().isDark) == null) {
    CacheService.setData(
      key: ConstText().isDark,
      value: false,
    );
  }
  runApp(
    BlocProvider(
      create: (context) => SwitchLanguageCubit(),
      child: const MyApp(),
    ),
  );
}
