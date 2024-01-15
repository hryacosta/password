import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/usecases/get_spaces.dart';

import '../../fixtures/fixture_reader.dart';
import '../../test_widget.mocks.dart';

void main() {
  late GetSpaces useCase;
  late MockSpaceRepository mockSpaceRepository;

  setUpAll(
    () {
      mockSpaceRepository = MockSpaceRepository();
      useCase = GetSpaces(mockSpaceRepository);
    },
  );

  test(
    'should get spaces from repository',
    () async {
      final fixtureSpaces = fixtureMap('get_spaces.json');
      final option = Option<List<dynamic>>.of(fixtureSpaces['spaces'])
          .getOrElse(() => <dynamic>[]);
      final spaces = option
          .map(
            (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
          )
          .toList();

      when(
        mockSpaceRepository.getSpaces(),
      ).thenAnswer(
        (_) async => Either<Failure, List<SpaceEntity>>.right(spaces),
      );

      final result = await useCase.call();

      expect(result.getRight().getOrElse(() => []), spaces);

      verify(mockSpaceRepository.getSpaces());

      verifyNoMoreInteractions(mockSpaceRepository);
    },
  );

  test('should param instance be equatable', () {
    const param = Param();
    const param_1 = Param();

    expect(param, equals(param_1));

    expect(param == param_1, true);

    expect(param_1.props, equals(param_1.props));
  });
}
