import 'package:flutter/material.dart';
import 'package:password/presentation/theme/app_colors.dart';
import 'package:password/presentation/theme/typography.dart';

final $lightTheme = ThemeData.light().copyWith(
  colorScheme: colorScheme,
  textTheme: typography,
  visualDensity: VisualDensity.comfortable,
  brightness: colorScheme.brightness,
  primaryColor: colorScheme.primary,
  primaryColorLight:
      Color.alphaBlend(Colors.white.withAlpha(0x66), colorScheme.primary),
  primaryColorDark:
      Color.alphaBlend(Colors.black.withAlpha(0x66), colorScheme.primary),
  secondaryHeaderColor:
      Color.alphaBlend(Colors.white.withAlpha(0xCC), colorScheme.primary),
  scaffoldBackgroundColor: colorScheme.surface,
  canvasColor: colorScheme.surface,
  cardColor: colorScheme.surface,
  dialogBackgroundColor: colorScheme.surface,
  indicatorColor: colorScheme.onPrimary,
  dividerColor: colorScheme.onSurface.withOpacity(0.12),
  applyElevationOverlayColor: false,
  bottomAppBarTheme: BottomAppBarTheme(
    color: colorScheme.surface,
  ),
);

final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  primaryContainer: AppColors.primaryContainer,
  onPrimaryContainer: AppColors.onPrimaryContainer,
  secondary: AppColors.secondary,
  onSecondary: AppColors.onSecondary,
  secondaryContainer: AppColors.secondaryContainer,
  onSecondaryContainer: AppColors.onSecondaryContainer,
  tertiary: AppColors.tertiary,
  onTertiary: AppColors.onTertiary,
  tertiaryContainer: AppColors.tertiaryContainer,
  onTertiaryContainer: AppColors.onTertiaryContainer,
  error: AppColors.error,
  onError: AppColors.onError,
  errorContainer: AppColors.errorContainer,
  onErrorContainer: AppColors.onErrorContainer,
  surface: AppColors.surface,
  onSurface: AppColors.onSurface,
  surfaceContainerHighest: AppColors.surfaceVariant,
  onSurfaceVariant: AppColors.onSurfaceVariant,
  outline: AppColors.outline,
  outlineVariant: AppColors.outlineVariant,
  shadow: AppColors.shadow,
  scrim: AppColors.scrim,
  inverseSurface: AppColors.inverseSurface,
  onInverseSurface: AppColors.onInverseSurface,
  inversePrimary: AppColors.inversePrimary,
  surfaceTint: AppColors.surfaceTint,
);
