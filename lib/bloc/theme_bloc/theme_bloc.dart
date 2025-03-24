import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learn_theme/service/storage_keys.dart';
import 'package:learn_theme/service/storage_repository.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<SwitchThemeEvent>((event, emit) => _switchTheme(event, emit));
    on<Init>((event, emit) => _init(event, emit));
    add(Init());
  }

  void _switchTheme(SwitchThemeEvent event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(themeMode: event.themeMode));
    await StorageRepository.putString(StorageKeys.theme, event.themeMode.name);
  }

  void _init(Init event, Emitter<ThemeState> emit) {
    final themeMode = StorageRepository.getString(StorageKeys.theme, defValue: 'system');
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    switch (themeMode) {
      case "light":
        {
          emit(state.copyWith(themeMode: ThemeMode.light));
        }
      case "dark":
        {
          emit(state.copyWith(themeMode: ThemeMode.dark));
        }
      case "system":
        {
          if (isDarkMode) {
            emit(state.copyWith(themeMode: ThemeMode.dark));
          } else {
            emit(state.copyWith(themeMode: ThemeMode.light));
          }
        }
      default:
        {
          if (isDarkMode) {
            emit(state.copyWith(themeMode: ThemeMode.dark));
          } else {
            emit(state.copyWith(themeMode: ThemeMode.light));
          }
        }
    }
  }
}

///class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
//   ThemeSwitcherBloc() : super(ThemeSwitcherState(MyFunctions.getThemeMode())) {
//     var brightness = PlatformDispatcher.instance.platformBrightness;
//     var window = SchedulerBinding.instance.platformDispatcher;
//     window.onPlatformBrightnessChanged = () {
//       WidgetsBinding.instance.handlePlatformBrightnessChanged();
//       brightness = window.platformBrightness;
//       final mode = StorageRepository.getString(AppConstants.THEME_MODE, defValue: "system");
//       if (mode == 'system') {
//         add(const SwitchThemeEvent(themeMode: ThemeMode.system));
//       }
//     };
//     on<SwitchThemeEvent>((event, emit) async {
//       emit(state.copyWith(themeMode: event.themeMode));
//       await StorageRepository.putString(AppConstants.THEME_MODE,  event.themeMode.name);
//     });
//   }
// }
