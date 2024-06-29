import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

@lazySingleton
class GetSpaces implements UseCase<List<SpaceEntity>, Param> {
  GetSpaces(this.repository);

  final SpaceRepository repository;

  @override
  Future<Either<Failure, List<SpaceEntity>>> call([Param? arg]) async =>
      repository.getSpaces();
}

class Param extends Equatable {
  const Param();

  @override
  List<Object?> get props => [];
}
