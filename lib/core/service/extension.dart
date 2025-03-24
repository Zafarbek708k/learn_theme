export "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:learn_theme/core/theme/custom_colors.dart';

import 'extension.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  CustomColors get themeExtension => theme.extension<CustomColors>()!;

  AppLocalizations get localized => AppLocalizations.of(this)!;
}
