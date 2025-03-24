import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color mainContainerColor;

  const CustomColors({required this.mainContainerColor});

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(mainContainerColor: mainContainerColor);
  }

  @override
  ThemeExtension<CustomColors> lerp(covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(mainContainerColor: mainContainerColor);
  }

  @override
  String toString() {
    return "toString method";
  }

  static CustomColors light = CustomColors(mainContainerColor: Color(0xffe3eaef));

  static CustomColors dark = CustomColors(mainContainerColor: Color(0xff222223));
}
