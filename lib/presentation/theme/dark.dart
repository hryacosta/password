import 'package:flutter/material.dart';
import 'package:password/presentation/theme/app_colors.dart';
import 'package:password/presentation/theme/typography.dart';

final $darkTheme = ThemeData.dark().copyWith(
  colorScheme: schemeDark,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: typography.bodyMedium?.copyWith(
      // fontWeight: FontWeight.w400,
      color: AppColors.onPrimary,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.indigo,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
    ),
    hintStyle: typography.bodyMedium?.copyWith(
      color: AppColors.onPrimary.withOpacity(0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
    ),
  ),
);

const ColorScheme schemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff5bd5fa),
  onPrimary: Color(0xff003543),
  primaryContainer: Color(0xff004e5f),
  onPrimaryContainer: Color(0xffb5ebff),
  secondary: Color(0xffb3cad4),
  onSecondary: Color(0xff1d333b),
  secondaryContainer: Color(0xff344a52),
  onSecondaryContainer: Color(0xffcfe6f0),
  tertiary: Color(0xffc2c4eb),
  onTertiary: Color(0xff2b2e4d),
  tertiaryContainer: Color(0xff424465),
  onTertiaryContainer: Color(0xffe0e0ff),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  surface: Color(0xff191c1d),
  onSurface: Color(0xffe1e3e4),
  surfaceContainerHighest: Color(0xff40484b),
  onSurfaceVariant: Color(0xffbfc8cc),
  outline: Color(0xff899296),
  outlineVariant: Color(0xff40484b),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffe1e3e4),
  onInverseSurface: Color(0xff2e3132),
  inversePrimary: Color(0xff00677e),
  surfaceTint: Color(0xff5bd5fa),
);
