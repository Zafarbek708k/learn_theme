part of 'language_bloc.dart';

class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class Init extends LanguageEvent {}

class ChangeLocaleEvent extends LanguageEvent {
  final Locale locale;

  const ChangeLocaleEvent(this.locale);
}
