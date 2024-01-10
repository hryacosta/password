import 'package:flutter/foundation.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/domain/entities/space.dart';
import 'package:password/domain/usecases/get_spaces.dart';

class HomeController with ChangeNotifier {
  HomeController();

  List<Space> spaces = [];

  Future<void> getSpaces() async {
    final result = await sl<GetSpaces>()(const Param());

    result.fold(
      logger.e,
      (r) {
        logger.d(r);
        spaces.addAll(r);
      },
    );

    notifyListeners();
  }
}
