import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_theme/core/service/extension.dart';
import 'package:learn_theme/feature/common/presentation/bloc/language_bloc/language_bloc.dart';

class LangButtons extends StatelessWidget {
  const LangButtons({super.key});

  static const lang = [Locale('uz', "UZ"), Locale("ru", "RU"), Locale("en", "EN")];

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      children: [
        ...List.generate(
          lang.length,
          (i) {
            final l = lang[i];
            return MaterialButton(
              height: 33,
              onPressed: () => context.read<LanguageBloc>().add(ChangeLocaleEvent(Locale(l.languageCode, l.countryCode))),
              color: context.themeExtension.mainContainerColor,
              child: Center(child: Text(l.languageCode)),
            );
          },
        )
      ],
    );
  }
}
