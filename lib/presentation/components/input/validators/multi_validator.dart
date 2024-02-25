import 'package:password/presentation/components/input/validators/field_validator.dart';

class MultiValidator extends FieldValidator<String?> {
  MultiValidator(this.validators) : super(_errorText);
  final List<FieldValidator<dynamic>> validators;
  static String _errorText = '';

  @override
  bool isValid(String? value) {
    for (final validator in validators) {
      if (validator.call(value) != null) {
        _errorText = validator.errorText;
        return false;
      }
    }
    return true;
  }

  @override
  String? call(dynamic value) {
    return isValid(value) ? null : _errorText;
  }
}
