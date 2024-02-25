import 'package:password/presentation/components/input/validators/text_field_validator.dart';

class MinLengthValidator extends TextFieldValidator {
  MinLengthValidator(this.min, {required String errorText}) : super(errorText);
  final int min;

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return value!.length >= min;
  }
}
