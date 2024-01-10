import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/usecases/get_spaces.dart';

import '../../fixtures/fixture_reader.dart';
import '../../test_widget.mocks.dart';

void main() {
  late GetSpaces useCase;
  late MockSpaceRepository mockSpaceRepository;

  setUp(
    () {
      mockSpaceRepository = MockSpaceRepository();
      useCase = GetSpaces(mockSpaceRepository);
    },
  );

  test(
    'should get spaces from repository',
    () async {
      final data = fixtureMap('get_spaces.json');

      final spaceModel = SpaceModel.fromJson(data);

      when(
        mockSpaceRepository.getSpaces(),
      ).thenAnswer(
        (_) async => Right(spaceModel.spaces),
      );

      final result = await useCase.call(
        const Param(),
      );

      expect(result.fold((l) => l, (r) => r), spaceModel.spaces);

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
