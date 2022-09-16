import 'package:either_dart/either.dart';
import 'package:simplibuy/cart/domain/repository/cart_list_repository.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';
import '../entities/item_cart_detail.dart';

class CartListUsecase {
  final CartListRepository repository;
  CartListUsecase({required this.repository});

  Future<Either<Failure, Result<List<ItemCartDetails>>>> getItemsInCart() =>
      repository.getItemsInCart();

  Future<Either<Failure, Result<double>>> getTotalPrice() =>
      repository.getTotalPrice();

  updateNumberOfItemsInCart(int number, ItemCartDetails details) {
    repository.updateNumberOfItemsInCart(number, details.id as int);
  }

  deleteCartItem(int id) {
    repository.deleteCartItem(id);
  }
}
