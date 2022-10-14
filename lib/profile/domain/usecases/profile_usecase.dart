import 'package:either_dart/either.dart';
import 'package:simplibuy/profile/domain/repository/profile_repository.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';
import '../entities/profile_details.dart';

class ProfileUsecase {
  final ProfileRepository repo;

  ProfileUsecase(this.repo);

  Future<Either<Failure, Result<ProfileDatails>>> getUserDetails() async {
    return repo.getUserDetails();
  }

  Future<Either<Failure, Result<String>>> updateUserProfileDetails(
      ProfileDatails details) async {
    return await repo.updateUserProfileDetails(details);
  }
}
