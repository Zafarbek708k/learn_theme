import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_theme/bloc/language_bloc/language_bloc.dart';
import 'package:learn_theme/service/extension.dart';
import 'package:learn_theme/service/storage_repository.dart';
import 'package:learn_theme/theme/theme.dart';
import 'bloc/theme_bloc/theme_bloc.dart';

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
                  title: 'Flutter Demo',
                  themeMode: themeState.themeMode,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  debugShowCheckedModeBanner: false,
                  locale: languageState.currentLocale,
                  home: const MyHomePage(),
                  theme: LightTheme.theme(),
                  darkTheme: DarkTheme.theme(),
                );
              },
            );
          },
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(context.localized.helloWorld)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: 75,
                decoration: BoxDecoration(
                  color: context.themeExtension.mainContainerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  final language = [
                    Locale('uz', "UZ"),
                    Locale('ru', "RU"),
                    Locale('en', "EN"),
                  ];
                  return Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        language.length,
                        (i) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xff423838),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                final l = language[i];
                                context.read<LanguageBloc>().add(ChangeLocaleEvent(Locale(l.languageCode, l.countryCode)));
                              },
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: Center(
                                  child: Text(
                                    language[i].languageCode,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          spacing: 6,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onPressed: () => context.read<ThemeBloc>().add(SwitchThemeEvent(ThemeMode.dark)),
              child: Icon(Icons.dark_mode_outlined),
            ),
            FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onPressed: () => context.read<ThemeBloc>().add(SwitchThemeEvent(ThemeMode.light)),
              child: Icon(Icons.light_mode_outlined),
            ),
          ],
        ),
      );
}
