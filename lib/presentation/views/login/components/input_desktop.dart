import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password/presentation/components/input/input_field.dart';

class InputDesktop extends StatelessWidget {
  const InputDesktop({
    required this.hintText,
    required this.onChange,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    super.key,
  });

  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChange;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: InputField(
        labelText: '',
        maxLength: 64,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        onChange: onChange,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
