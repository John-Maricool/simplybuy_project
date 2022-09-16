import 'package:either_dart/either.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import 'package:simplibuy/cart/domain/repository/cart_list_repository.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/local_db/cart_dao.dart';
import 'package:simplibuy/core/result/result.dart';
import 'package:simplibuy/core/failure/failure.dart';

class CartListRepositoryImpl implements CartListRepository {
  final CartDao dao;
  CartListRepositoryImpl({required this.dao});

  @override
  Future<Either<Failure, Result<List<ItemCartDetails>>>>
      getItemsInCart() async {
    var result = await dao.getAllCartItems().first;
    if (result.isEmpty) {
      return Left(Failure(error: EmptyListError()));
    } else {
      return Right(Result(value: result));
    }
  }

  @override
  Future<Either<Failure, Result<double>>> getTotalPrice() async {
    var result = 0;
    if (result == 0.0) {
      return Left(Failure(error: DefaultError()));
    } else {
      return Right(Result(value: result as double));
    }
  }

  @override
  updateNumberOfItemsInCart(int number, int id) async {
    await dao.updateNumberOfItems(number, id);
  }

  @override
  deleteCartItem(int id) async {
    await dao.removeFromCart(id);
  }
}
