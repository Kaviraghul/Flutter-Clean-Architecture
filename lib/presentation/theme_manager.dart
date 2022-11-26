import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/font_manager.dart';
import 'package:flutter_clean_architecture/presentation/styles_manager.dart';
import 'package:flutter_clean_architecture/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  final theme = ThemeData(
    primaryColor      : ColorManager.primary,
    primaryColorLight : ColorManager.primaryOpacity70,
    primaryColorDark  : ColorManager.darkPrimary,
    disabledColor     : ColorManager.grey1,

    //card theme

    cardTheme         : CardTheme(
      color           : ColorManager.white,
      shadowColor     : ColorManager.grey,
      elevation       : AppSize.s4,
    ),

    //app bar theme

    appBarTheme: AppBarTheme(
      centerTitle     : true,
      color           : ColorManager.primary,
      elevation       : AppSize.s4,
      shadowColor     : ColorManager.primaryOpacity70,
      titleTextStyle  :
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),

    //button theme

    buttonTheme: ButtonThemeData(
      shape         : const StadiumBorder(),
      disabledColor : ColorManager.grey1,
      buttonColor   : ColorManager.primary,
      splashColor   : ColorManager.primaryOpacity70,
    ),

    //elevated button theme

    elevatedButtonTheme : ElevatedButtonThemeData(
      style   : ElevatedButton.styleFrom(
        textStyle       : getRegularStyle(color: ColorManager.white),
        foregroundColor : ColorManager.primary,
        shape           : RoundedRectangleBorder(
          borderRadius : BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //Text theme

    textTheme: TextTheme(
      headline1 : getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      subtitle1 : getMediumStyle  (color: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption   : getRegularStyle (color: ColorManager.grey1),
      bodyText1 : getRegularStyle (color: ColorManager.grey),
    )
  );

  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(secondary: ColorManager.grey),
  );
}
