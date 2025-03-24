import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_theme/core/service/extension.dart';
import 'package:learn_theme/feature/common/presentation/pages/common.dart';
import 'core/service/storage_repository.dart';
import 'core/theme/theme.dart';
import 'feature/common/presentation/bloc/language_bloc/language_bloc.dart';
import 'feature/common/presentation/bloc/theme_bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => ThemeBloc()),
          BlocProvider(create: (ctx) => LanguageBloc()),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, languageState) {
            return BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp(
                  title: 'App Theme',
                  themeMode: themeState.themeMode,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  debugShowCheckedModeBanner: false,
                  locale: languageState.currentLocale,
                  home: const CommonUi(),
                  theme: LightTheme.theme(),
                  darkTheme: DarkTheme.theme(),
                );
              },
            );
          },
        ),
      );
}
