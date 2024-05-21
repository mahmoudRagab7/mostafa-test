import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_card/core/consts/const_text.dart';
import 'package:nfc_card/core/services/cache_service.dart';

part 'switch_language_event.dart';
part 'switch_language_state.dart';

class SwitchLanguageCubit
    extends Bloc<SwitchLanguageEvent, SwitchLanguageState> {
  SwitchLanguageCubit() : super(const SwitchLanguageInitial(false)) {
    on<ArabicLanguageEvent>((event, emit) {
      CacheService.setData(key: ConstText().isArabic, value: true);
      emit(const SwitchLanguageInitial(true));
    });
    on<EnglishLanguageEvent>((event, emit) {
      CacheService.setData(key: ConstText().isArabic, value: false);
      emit(const SwitchLanguageInitial(false));
    });
  }
}
