import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/language_bloc/switch_language_bloc.dart';
import 'package:nfc_card/core/services/cache_service.dart';
import 'package:nfc_card/features/auth/cubit/auth_cubit.dart';
import 'package:nfc_card/features/auth/view/login_view.dart';
import 'package:nfc_card/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchLanguageCubit, SwitchLanguageState>(
      builder: (context, state) {
        return BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
          child: MaterialApp(
            locale: CacheService.getData(key: ConstText().isArabic)
                ? const Locale('ar')
                : const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const LoginView(), 
          ),
        );
      },
    );
  }
}
