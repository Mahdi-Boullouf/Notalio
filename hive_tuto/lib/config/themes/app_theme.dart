import 'package:flutter/material.dart';
import 'package:hive_tuto/core/res/app_colors.dart';
import 'package:hive_tuto/core/res/app_strings.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      fontFamily: AppStrings.appFontName,
      brightness: Brightness.dark,
      disabledColor: Colors.white12,
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: const MaterialStatePropertyAll(
                AppColors.containersColor,
              ))),
      colorSchemeSeed: const Color.fromARGB(255, 0, 225, 255));
}
