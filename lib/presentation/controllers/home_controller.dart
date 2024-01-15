import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/config/injectable.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/usecases/get_spaces.dart';

class HomeController with ChangeNotifier {
  HomeController();

  List<SpaceEntity> spaces = [];

  Future<void> getSpaces() async {
    final result = await sl<GetSpaces>()();

    if (result.isRight()) {
      spaces.addAll(result.getRight().getOrElse(() => []));
    }

    notifyListeners();
  }
}
