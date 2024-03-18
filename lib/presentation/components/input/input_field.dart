import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password/presentation/theme/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.labelText,
    required this.onChange,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.borderEnabled = true,
    this.suffixIcon,
    this.hintText,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.newline,
    this.onFieldSubmitted,
    this.focusNode,
    this.initialValue,
    this.autocorrect = false,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.controller,
    this.decoration,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.floatingLabelBehavior,
    this.hintStyle,
    this.suffixIconConstraints,
    this.autoValidateMode,
    this.buildCounter,
    this.selectionControls,
    this.onTapOutside,
    this.maxLength,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.style,
    super.key,
  });

  final String? initialValue;
  final String labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final bool borderEnabled;
  final bool obscureText;
  final void Function(String) onChange;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final TapRegionCallback? onTapOutside;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autocorrect;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool autofocus;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? hintStyle;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autoValidateMode;
  final InputCounterWidgetBuilder? buildCounter;
  final TextSelectionControls? selectionControls;
  final bool enableSuggestions;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: decoration ??
          InputDecoration(
            counterText: '',
            labelText: labelText,
            labelStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
            hintText: hintText,
            hintStyle: hintStyle ??
                textTheme.bodyMedium
                    ?.copyWith(color: AppColors.secondary.withOpacity(0.4)),
            errorStyle: textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.error),
            floatingLabelBehavior: floatingLabelBehavior,
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.secondaryVariant, width: 2),
            ),
            enabledBorder: borderEnabled
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primaryVariant,
                    ),
                  )
                : InputBorder.none,
          ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style:
          style ?? textTheme.bodyMedium?.copyWith(color: AppColors.textColor),
      autofocus: autofocus,
      obscureText: obscureText,
      autocorrect: autocorrect,
      onChanged: onChange,
      onTapOutside: onTapOutside,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      inputFormatters: inputFormatters,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      buildCounter: buildCounter,
      autovalidateMode: autoValidateMode,
      enableSuggestions: enableSuggestions,
      maxLength: maxLength,
      maxLines: maxLines,
      maxLengthEnforcement: maxLengthEnforcement,
    );
  }
}
