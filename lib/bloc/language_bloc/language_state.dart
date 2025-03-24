part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale currentLocale;

  const LanguageState({
    this.currentLocale = const Locale('en', "EN"),
  });

  LanguageState copyWith({
    Locale? currentLocale,
  }) =>
      LanguageState(
        currentLocale: currentLocale ?? this.currentLocale,
      );

  @override
  List<Object?> get props => [currentLocale];
}
