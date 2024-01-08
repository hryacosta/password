import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/space.dart';

@lazySingleton
class AddSpace implements UseCase<Space, Params> {
  @override
  Future<Either<Failure, Space>> call(Params params) {
    throw UnimplementedError();
  }
}

class Params extends Equatable {
  const Params();

  @override
  List<Object?> get props => [];
}
