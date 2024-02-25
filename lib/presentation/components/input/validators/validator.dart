import 'package:fzregex/utils/pattern.dart';
import 'package:password/presentation/components/input/validators/email_validator.dart';
import 'package:password/presentation/components/input/validators/min_length_validator.dart';
import 'package:password/presentation/components/input/validators/multi_validator.dart';
import 'package:password/presentation/components/input/validators/pattern_validator.dart';
import 'package:password/presentation/components/input/validators/text_field_validator.dart';

class Validator {
  static MultiValidator Function({
    required String errorTextFormat,
    required String errorTextRequired,
  }) emailValidator = ({
    required String errorTextRequired,
    required String errorTextFormat,
  }) =>
      MultiValidator([
        RequiredValidator(errorText: errorTextRequired),
        EmailValidator(
          errorText: errorTextFormat,
        ),
      ]);

  static MultiValidator Function({
    required String errorTextFormat,
    required String errorTextRequired,
    required String errorTextMustBeLonger,
  }) passwordValidator = ({
    required String errorTextRequired,
    required String errorTextMustBeLonger,
    required String errorTextFormat,
  }) =>
      MultiValidator([
        RequiredValidator(errorText: errorTextRequired),
        MinLengthValidator(
          8,
          errorText: errorTextMustBeLonger,
        ),
        PatternValidator(
          FzPattern.passwordHard,
          errorText: errorTextFormat,
        ),
      ]);
}
