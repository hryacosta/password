import 'package:password/core/utils/app_pattern.dart';
import 'package:password/presentation/components/input/validators/text_field_validator.dart';

class EmailValidator extends TextFieldValidator {
  EmailValidator({required String errorText}) : super(errorText);

  /// regex pattern to validate email inputs.
  final Pattern _emailPattern = AppPattern.email.pattern;

  @override
  bool isValid(String? value) =>
      hasMatch(_emailPattern.toString(), value!, caseSensitive: false);
}
