import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

@lazySingleton
class AddSpace implements UseCase<String, Param> {
  AddSpace(this.repository);

  final SpaceRepository repository;

  @override
  Future<Either<Failure, String>> call(Param arg) async =>
      repository.addSpace(arg.space);
}

class Param extends Equatable {
  const Param({required this.space});

  final SpaceEntity space;

  @override
  List<Object?> get props => [space];
}
