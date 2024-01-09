import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/usecases/get_spaces.dart';

import '../../fixtures/fixture_reader.dart';
import '../../widget_test.mocks.dart';

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
    'should get manga chapters from repository',
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
}
