import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:password/config/injectable.dart';
import 'package:password/domain/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params arg);

  void close() => sl<http.Client>().close();
}
