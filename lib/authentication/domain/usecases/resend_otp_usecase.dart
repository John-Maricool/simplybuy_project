import 'package:either_dart/either.dart';
import 'package:simplibuy/authentication/data/repositories/verify_email_repository_impl.dart';
import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';

class ResendOtpUsecase {
  final VerifyEmailRepoImpl repository;
  ResendOtpUsecase(this.repository);

  Future<Either<Failure, Result<String>>> resendOtp(
      String userId, String email) async {
    return repository.resendOtp(userId, email);
  }
}
