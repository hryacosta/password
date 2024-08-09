import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case_no_params.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

@lazySingleton
class GetSpaces implements UseCaseNoParams<List<SpaceEntity>> {
  GetSpaces(this.repository);

  final SpaceRepository repository;

  @override
  Future<Either<Failure, List<SpaceEntity>>> call() async =>
      repository.getSpaces();
}
