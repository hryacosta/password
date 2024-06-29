import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

@lazySingleton
class DeleteSpaces implements UseCase<String, Param> {
  DeleteSpaces(this.repository);

  final SpaceRepository repository;

  @override
  Future<Either<Failure, String>> call(Param arg) async =>
      repository.deleteSpace(arg.id);
}

class Param extends Equatable {
  const Param({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}
