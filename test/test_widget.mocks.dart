// Mocks generated by Mockito 5.4.4 from annotations
// in password/test/test_widget.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:chopper/chopper.dart' as _i9;
import 'package:fpdart/fpdart.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:password/data/datasources/space_remote_datasource.dart' as _i8;
import 'package:password/data/models/space_model.dart' as _i10;
import 'package:password/domain/entities/session_entity.dart' as _i12;
import 'package:password/domain/entities/space_entity.dart' as _i6;
import 'package:password/domain/failures/failure.dart' as _i5;
import 'package:password/domain/repositories/authentication_repository.dart'
    as _i11;
import 'package:password/domain/repositories/spaces_repository.dart' as _i2;
import 'package:password/domain/usecases/sign_in.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeType_0 extends _i1.SmartFake implements Type {
  _FakeType_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SpaceRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSpaceRepository extends _i1.Mock implements _i2.SpaceRepository {
  MockSpaceRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Either<_i5.Failure, List<_i6.SpaceEntity>>> getSpaces() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSpaces,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, List<_i6.SpaceEntity>>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, List<_i6.SpaceEntity>>>(
          this,
          Invocation.method(
            #getSpaces,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, List<_i6.SpaceEntity>>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, String>> addSpace(
          _i6.SpaceEntity? space) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSpace,
          [space],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, String>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, String>>(
          this,
          Invocation.method(
            #addSpace,
            [space],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, String>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, String>> updateSpace(
          _i6.SpaceEntity? space) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateSpace,
          [space],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, String>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, String>>(
          this,
          Invocation.method(
            #updateSpace,
            [space],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, String>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, String>> deleteSpace(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteSpace,
          [id],
        ),
        returnValue: _i3.Future<_i4.Either<_i5.Failure, String>>.value(
            _i7.dummyValue<_i4.Either<_i5.Failure, String>>(
          this,
          Invocation.method(
            #deleteSpace,
            [id],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, String>>);
}

/// A class which mocks [SpaceRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSpaceRemoteDataSource extends _i1.Mock
    implements _i8.SpaceRemoteDataSource {
  MockSpaceRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.ChopperClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _i7.dummyValue<_i9.ChopperClient>(
          this,
          Invocation.getter(#client),
        ),
      ) as _i9.ChopperClient);

  @override
  set client(_i9.ChopperClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Type get definitionType => (super.noSuchMethod(
        Invocation.getter(#definitionType),
        returnValue: _FakeType_0(
          this,
          Invocation.getter(#definitionType),
        ),
      ) as Type);

  @override
  _i3.Future<_i9.Response<void>> addSpace(_i6.SpaceEntity? space) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSpace,
          [space],
        ),
        returnValue: _i3.Future<_i9.Response<void>>.value(
            _i7.dummyValue<_i9.Response<void>>(
          this,
          Invocation.method(
            #addSpace,
            [space],
          ),
        )),
      ) as _i3.Future<_i9.Response<void>>);

  @override
  _i3.Future<_i9.Response<List<_i10.SpaceModel>>> getSpaces() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSpaces,
          [],
        ),
        returnValue: _i3.Future<_i9.Response<List<_i10.SpaceModel>>>.value(
            _i7.dummyValue<_i9.Response<List<_i10.SpaceModel>>>(
          this,
          Invocation.method(
            #getSpaces,
            [],
          ),
        )),
      ) as _i3.Future<_i9.Response<List<_i10.SpaceModel>>>);

  @override
  _i3.Future<_i9.Response<void>> deleteSpace(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteSpace,
          [id],
        ),
        returnValue: _i3.Future<_i9.Response<void>>.value(
            _i7.dummyValue<_i9.Response<void>>(
          this,
          Invocation.method(
            #deleteSpace,
            [id],
          ),
        )),
      ) as _i3.Future<_i9.Response<void>>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i11.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>> signIn(
          _i13.Param? arg) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [arg],
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, _i12.SessionEntity>>(
          this,
          Invocation.method(
            #signIn,
            [arg],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>> signUp() =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, _i12.SessionEntity>>(
          this,
          Invocation.method(
            #signUp,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>>);

  @override
  _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>> signOut() =>
      (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue:
            _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>>.value(
                _i7.dummyValue<_i4.Either<_i5.Failure, _i12.SessionEntity>>(
          this,
          Invocation.method(
            #signOut,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Either<_i5.Failure, _i12.SessionEntity>>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i14.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i3.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
