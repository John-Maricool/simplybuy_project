import 'package:either_dart/either.dart';
import 'package:simplibuy/core/local_db/to_buy_dao.dart';
import 'package:simplibuy/to_buy_list/data/model/to_buy_model.dart';

import '../../../core/error_types/error_types.dart';
import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';

abstract class ToBuyRepository {
  addItemToBuy(ToBuyModel toBuyModel);
  Future<Either<Failure, Result<List<ToBuyModel>>>> getAllItemsToBuy();
  removeItemToBuy(int id);
  updateItem(String item, int id);
  changeIsBought(int id, bool isBought);
}

class ToBuyRepositoryImpl implements ToBuyRepository {
  final ToBuyModelDao dao;
  ToBuyRepositoryImpl({required this.dao});

  @override
  addItemToBuy(ToBuyModel toBuyModel) async {
    await dao.insertNewItemsToBuy(toBuyModel);
  }

  @override
  Future<Either<Failure, Result<List<ToBuyModel>>>> getAllItemsToBuy() async {
    final res = await dao.getAllItemsToBuy();
    if (res.isEmpty) {
      return Left(Failure(error: EmptyListError()));
    } else {
      print(res[0].id.toString());
      return Right(Result(value: res));
    }
  }

  @override
  removeItemToBuy(int id) async {
    await dao.deleteItemToBuy(id);
  }

  @override
  updateItem(String item, int id) async {
    await dao.updateNewItemToBuy(id, item);
  }

  @override
  changeIsBought(int id, bool isBought) async {
    await dao.changeIsBought(id, isBought);
  }
}
