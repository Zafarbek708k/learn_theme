import 'package:flutter/material.dart';
import 'package:learn_theme/theme/custom_colors.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  CustomColors get themeExtension => theme.extension<CustomColors>()!;
}
