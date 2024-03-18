import 'package:flutter/material.dart';
import 'package:password/presentation/theme/app_colors.dart';

class Button extends StatelessWidget {
  const Button({
    required this.label,
    required this.onPress,
    this.disabled = false,
    this.isLoading = false,
    this.textStyle,
    this.buttonStyle,
    this.elevation = 4.0,
    this.delayed = Duration.zero,
    this.onWithDelayPress,
    super.key,
  });

  final String label;
  final bool disabled;
  final bool isLoading;
  final VoidCallback onPress;
  final void Function()? onWithDelayPress;
  final TextStyle? textStyle;
  final ElevatedButton? buttonStyle;
  final Duration delayed;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    const height = 44.0;
    const letterSpacing = 2.0;
    const disabledForegroundColor = 0.38;
    const disabledBackgroundColor = 0.12;

    final borderRadiusTemp =
        const BorderRadius.all(Radius.circular(25)).copyWith(
      topLeft: const Radius.circular(10),
    );

    void onPressed() {
      if (delayed.inMilliseconds > 0) FocusScope.of(context).unfocus();

      Future.delayed(
        delayed,
        onPress,
      );
    }

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      disabledForegroundColor:
          AppColors.onSurface.withOpacity(disabledForegroundColor),
      disabledBackgroundColor:
          AppColors.onSurface.withOpacity(disabledBackgroundColor),
      elevation: elevation,
      visualDensity: VisualDensity.standard,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadiusTemp,
      ),
    );

    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          letterSpacing: letterSpacing,
          color: AppColors.onPrimary,
        );

    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadiusTemp,
            ),
            height: height,
            child: ElevatedButton(
              key: const Key('button-key'),
              onPressed: !disabled && !isLoading ? onPressed : null,
              style: buttonStyle,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label.toUpperCase(),
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Visibility(
                visible: isLoading,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
