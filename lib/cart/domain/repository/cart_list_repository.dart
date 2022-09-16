import 'package:either_dart/either.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';
import '../entities/item_cart_detail.dart';

abstract class CartListRepository {
  Future<Either<Failure, Result<List<ItemCartDetails>>>> getItemsInCart();

  updateNumberOfItemsInCart(int number, int id);

  Future<Either<Failure, Result<double>>> getTotalPrice();

  deleteCartItem(int id);
}
