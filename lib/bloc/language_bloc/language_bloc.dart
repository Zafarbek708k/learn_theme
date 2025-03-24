import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_theme/service/storage_keys.dart';
import 'package:learn_theme/service/storage_repository.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<LanguageEvent>((event, emit) {});
    on<ChangeLocaleEvent>((event, emit) => _change(event, emit));
    on<Init>((event, emit) => _init(event, emit));
    add(Init());
  }

  FutureOr<void> _init(Init event, Emitter<LanguageState> emit) async {
    final currentLanguage = StorageRepository.getString(StorageKeys.locale);

    switch (currentLanguage) {
      case "uz":
        {
          emit(state.copyWith(currentLocale: Locale('uz', 'Uz')));
        }
      case "ru":
        {
          emit(state.copyWith(currentLocale: Locale('ru', 'RU')));
        }
      case "en":
        {
          emit(state.copyWith(currentLocale: Locale('en', 'EN')));
        }
      default:
        {
          emit(state.copyWith(currentLocale: Locale('uz', 'Uz')));
        }
    }
  }

  FutureOr<void> _change(ChangeLocaleEvent event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(currentLocale: Locale(event.locale.languageCode, event.locale.countryCode)));
    await StorageRepository.putString(StorageKeys.locale, event.locale.languageCode);
  }
}
