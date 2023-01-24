import 'package:either_dart/either.dart';
import 'package:simplibuy/to_buy_list/domain/repository/to_buy_repository.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';
import '../../data/model/to_buy_model.dart';

abstract class ToBuyUsecase {
  addItemToBuy(ToBuyModel toBuyModel);
  getAllItemsToBuy(Function(Either<Failure, Result<List<ToBuyModel>>> b) res);
  removeItemToBuy(int id);
  updateItem(String item, int id);
  changeIsBought(int id, bool isBought);
}

class ToBuyUsecaseImpl implements ToBuyUsecase {
  final ToBuyRepository repo;
  ToBuyUsecaseImpl({required this.repo});

  @override
  addItemToBuy(ToBuyModel toBuyModel) {
    repo.addItemToBuy(toBuyModel);
  }

  @override
  getAllItemsToBuy(Function(Either<Failure, Result<List<ToBuyModel>>> b) res) {
    return repo.getAllItemsToBuy().then((value) => res.call(value));
  }

  @override
  removeItemToBuy(int id) async {
    await repo.removeItemToBuy(id);
  }

  @override
  updateItem(String item, int id) async {
    await repo.updateItem(item, id);
  }

  @override
  changeIsBought(int id, bool isBought) async {
    await repo.changeIsBought(id, isBought);
  }
}
