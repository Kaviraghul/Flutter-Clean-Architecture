import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  final theme = ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    cardTheme: CardTheme(color: ColorManager.white, shadowColor: ColorManager.grey, elevation: AppSize.s4)
  );

  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(secondary: ColorManager.grey),
  );
}
