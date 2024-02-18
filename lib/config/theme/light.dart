import 'package:flutter/material.dart';
import 'package:password/config/theme/colors.dart' as app;
import 'package:password/config/theme/typography.dart';

final $lightTheme = ThemeData(
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
  scaffoldBackgroundColor: colorScheme.background,
  canvasColor: colorScheme.background,
  cardColor: colorScheme.surface,
  dialogBackgroundColor: colorScheme.surface,
  indicatorColor: colorScheme.onPrimary,
  dividerColor: colorScheme.onSurface.withOpacity(0.12),
  applyElevationOverlayColor: false,
  useMaterial3: true,
  bottomAppBarTheme: BottomAppBarTheme(
    color: colorScheme.surface,
  ),
);

final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: app.Colors.primary,
  onPrimary: app.Colors.onPrimary,
  primaryContainer: app.Colors.primaryContainer,
  onPrimaryContainer: app.Colors.onPrimaryContainer,
  secondary: app.Colors.secondary,
  onSecondary: app.Colors.onSecondary,
  secondaryContainer: app.Colors.secondaryContainer,
  onSecondaryContainer: app.Colors.onSecondaryContainer,
  tertiary: app.Colors.tertiary,
  onTertiary: app.Colors.onTertiary,
  tertiaryContainer: app.Colors.tertiaryContainer,
  onTertiaryContainer: app.Colors.onTertiaryContainer,
  error: app.Colors.error,
  onError: app.Colors.onError,
  errorContainer: app.Colors.errorContainer,
  onErrorContainer: app.Colors.onErrorContainer,
  background: app.Colors.background,
  onBackground: app.Colors.onBackground,
  surface: app.Colors.surface,
  onSurface: app.Colors.onSurface,
  surfaceVariant: app.Colors.surfaceVariant,
  onSurfaceVariant: app.Colors.onSurfaceVariant,
  outline: app.Colors.outline,
  outlineVariant: app.Colors.outlineVariant,
  shadow: app.Colors.shadow,
  scrim: app.Colors.scrim,
  inverseSurface: app.Colors.inverseSurface,
  onInverseSurface: app.Colors.onInverseSurface,
  inversePrimary: app.Colors.inversePrimary,
  surfaceTint: app.Colors.surfaceTint,
);
