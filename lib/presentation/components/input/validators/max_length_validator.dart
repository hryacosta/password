import 'package:password/presentation/components/input/validators/text_field_validator.dart';

class MaxLengthValidator extends TextFieldValidator {
  MaxLengthValidator(this.max, {required String errorText}) : super(errorText);
  final int max;

  @override
  bool isValid(String? value) {
    return value!.length <= max;
  }
}
