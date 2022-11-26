import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/color_manager.dart';

ThemeData getApplicationTheme() {
  final theme = ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
  );

  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(secondary: ColorManager.grey),
  );
}
