part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class SwitchThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  const SwitchThemeEvent(this.themeMode);
}

class Init extends ThemeEvent {}
