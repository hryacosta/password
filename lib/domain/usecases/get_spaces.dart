import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/space.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

@lazySingleton
class GetSpaces extends UseCase<List<Space>, Param> {
  GetSpaces(this.repository);

  final SpaceRepository repository;

  @override
  Future<Either<Failure, List<Space>>> call(Param arg) async =>
      repository.getSpaces();
}

class Param extends Equatable {
  const Param();

  @override
  List<Object?> get props => [];
}
