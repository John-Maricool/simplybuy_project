import 'package:either_dart/either.dart';
import 'package:simplibuy/core/failure/failure.dart';
import 'package:simplibuy/core/result/result.dart';
import 'package:simplibuy/profile/domain/entities/profile_details.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Result<ProfileDatails>>> getUserDetails();
  Future<Either<Failure, Result<String>>> updateUserProfileDetails(
      ProfileDatails details);
}
