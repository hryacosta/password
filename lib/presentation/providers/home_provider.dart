import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/domain/entities/password_entity.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/usecases/add_password.dart';
import 'package:password/domain/usecases/get_count_passwords.dart';
import 'package:password/domain/usecases/get_spaces.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider();

  List<SpaceEntity> spaces = [];

  String password = '';
  String username = '';
  String title = '';

  Future<List<SpaceEntity>> getSpaces() async {
    final result = await sl<GetSpaces>()();

    final spacesList = result.getRight().getOrElse(() => []);

    spaces.addAll(spacesList);

    return spacesList;
  }

  void changePassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void changeUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void changeTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void _cleanAllState() {
    password = '';
    username = '';
    title = '';
    notifyListeners();
  }

  Future<void> addPassword() async {
    await sl<AddPassword>().call(
      PasswordEntity(
        username: username,
        password: password,
        title: title,
      ),
    );

    _cleanAllState();
  }

  Future<int> getCountPasswords() async {
    final result = await sl<GetCountPasswords>().call();

    return result.fold(
      (l) => 0,
      (r) => r,
    );
  }
}
