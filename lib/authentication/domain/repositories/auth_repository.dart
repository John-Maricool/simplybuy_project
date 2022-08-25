import 'package:either_dart/either.dart';
import 'package:simplibuy/core/failure/failure.dart';
import '../../../core/result/result.dart';

abstract class AuthRepository<T> {
  Future<Either<Failure, Result<String>>> sendAuthDetails(T detail);
  Future<Either<Failure, Result<String>>> authenticateWithFacebook();
  Future<Either<Failure, Result<String>>> authenticateWithGoogle();
}
