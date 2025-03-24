import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_theme/service/extension.dart';
import 'package:learn_theme/service/storage_repository.dart';
import 'package:learn_theme/theme/theme.dart';
import 'package:learn_theme/theme_bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeState.themeMode,
              home: const MyHomePage(),
              theme: LightTheme.theme(),
              darkTheme: DarkTheme.theme(),
            );
          },
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
