import 'package:password/presentation/components/input/validators/text_field_validator.dart';

class PatternValidator extends TextFieldValidator {
  PatternValidator(
    this.pattern, {
    required String errorText,
    this.caseSensitive = true,
  }) : super(errorText);
  final Pattern pattern;
  final bool caseSensitive;

  @override
  bool isValid(String? value) =>
      hasMatch(pattern.toString(), value!, caseSensitive: caseSensitive);
}
