import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/domain/entities/signup_details.dart';
import 'package:simplibuy/authentication/domain/repositories/auth_repository.dart';
import 'package:simplibuy/core/failure/failure.dart';
import 'package:simplibuy/core/result/result.dart';
import '../../../core/network/network_info.dart';

typedef _TestResult = Future<Result<SignupDetail>> Function();

class SignupRepositoryImpl implements AuthRepository<SignupDetail> {
  final NetworkInfo networkInfo;

  SignupRepositoryImpl({required this.networkInfo});

  @override
  Future<Either<Failure, Result<String>>> sendAuthDetails(
      SignupDetail detail) async {
    return await _doTask(() {
      return Future.delayed(1000.milliseconds);
    });
  }

  @override
  Future<Either<Failure, Result<String>>> authenticateWithFacebook() async {
    return await _doTask(() {
      return Future.delayed(1000.milliseconds);
    });
  }

  @override
  Future<Either<Failure, Result<String>>> authenticateWithGoogle() async {
    return await _doTask(() {
      return Future.delayed(1000.milliseconds);
    });
  }

  Future<Either<Failure, Result<String>>> _doTask(
    _TestResult res,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        res;
        return Right(Result(value: ""));
      } on Exception {
        return const Left(Failure());
      }
    }
    return const Left(Failure());
  }
}
