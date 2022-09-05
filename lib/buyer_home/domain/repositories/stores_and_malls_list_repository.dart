import 'package:either_dart/either.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import 'package:simplibuy/core/failure/failure.dart';
import '../../../core/result/result.dart';

abstract class StoresAndMallsRepository {
  Future<Either<Failure, Result<List<StoreDetails>>>> getStores();
  Future<Either<Failure, Result<List<StoreDetails>>>> getMalls();
  Future<Either<Failure, Result<List<StoreDetails>>>> searchStoreOrMall(
      String query);
}
