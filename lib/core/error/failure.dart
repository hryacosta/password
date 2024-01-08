import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.error, this.stackTrace]);

  final dynamic error;

  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [error, stackTrace];
}

/// Exception thrown when an error occurs while fetching data from the cache
class ServerFailure extends Failure {
  const ServerFailure([super.error, super.stackTrace]);

  @override
  List<Object?> get props => [super.error, super.stackTrace];
}

/// Exception thrown when an error occurs while fetching data from the cache
class CacheFailure extends Failure {
  const CacheFailure([super.error, super.stackTrace]);

  @override
  List<Object?> get props => [super.error, super.stackTrace];
}
