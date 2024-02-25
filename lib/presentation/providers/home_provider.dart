import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/config/injectable.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/usecases/get_spaces.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider();

  List<SpaceEntity> spaces = [];

  Future<List<SpaceEntity>> getSpaces() async {
    final result = await sl<GetSpaces>()();

    if (result.isRight()) {
      final spacesList = result.getRight().getOrElse(() => []);

      spaces.addAll(spacesList);

      return spacesList;
    }

    return [];
  }
}
