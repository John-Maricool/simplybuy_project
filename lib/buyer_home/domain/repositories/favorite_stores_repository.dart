import 'package:either_dart/either.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';

abstract class FavStoresAndMallsRepository {
  addStoreToFavorite(StoreDetails storeDetails);
  Future<Either<Failure, Result<List<StoreDetails>>>>
      getAllFavoriteStoresAndMalls();
  removeStoreFromFavorite(int id);
}
