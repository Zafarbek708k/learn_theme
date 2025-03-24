import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_theme/core/service/extension.dart';
import 'package:learn_theme/feature/common/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:learn_theme/feature/common/presentation/widgets/lang_buttons.dart';

class CommonUi extends StatefulWidget {
  const CommonUi({super.key});

  @override
  State<CommonUi> createState() => _CommonUiState();
}

class _CommonUiState extends State<CommonUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localized.helloWorld),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  LangButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.localized.home,
              style: TextStyle(color: Colors.red),
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
}
