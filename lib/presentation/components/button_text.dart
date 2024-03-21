import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    required this.label,
    this.onPressed,
    this.labelStyle,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: labelStyle,
      ),
    );
  }
}
