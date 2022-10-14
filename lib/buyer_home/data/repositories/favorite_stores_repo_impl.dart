import 'package:either_dart/either.dart';
import 'package:simplibuy/buyer_home/data/models/fav_stores_model.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/local_db/fav_stores_dao.dart';
import 'package:simplibuy/core/result/result.dart';

import '../../../core/failure/failure.dart';
import '../../domain/repositories/favorite_stores_repository.dart';

class FavStoresRepoImpl implements FavStoresAndMallsRepository {
  final FavStoresDao dao;
  FavStoresRepoImpl({required this.dao});

  @override
  addStoreToFavorite(StoreDetails storeDetails) async {
    await dao.addToFavorite(_convertToFavStoreModel(storeDetails));
  }

  @override
  removeStoreFromFavorite(int id) async {
    await dao.removeFromFav(id);
  }

  @override
  Future<Either<Failure, Result<List<StoreDetails>>>>
      getAllFavoriteStoresAndMalls() async {
    final res = await dao.getAllFavStores().first;
    if (res.isEmpty) {
      return Left(Failure(error: EmptyListError()));
    } else {
      return Right(Result(value: _convertFavList(res)));
    }
  }

  FavStoresModel _convertToFavStoreModel(StoreDetails details) {
    return FavStoresModel(
        id: details.id,
        storeName: details.name,
        location: details.location,
        imageLogo: details.imageLogo,
        storeAddress: details.address,
        rating: details.ratings);
  }

  StoreDetails _convertToStoreDetails(FavStoresModel details) {
    return StoreDetails(
      id: details.id,
      name: details.storeName,
      location: details.location,
      //imageLogo: details.imageLogo,
      //storeAddress: details.address,
      //rating: details.ratings);
    );
  }

  List<StoreDetails> _convertFavList(List<FavStoresModel> details) {
    return details.map((e) => _convertToStoreDetails(e)).toList();
  }
}
