// ignore_for_file: invalid_use_of_protected_member

import 'package:get/state_manager.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import 'package:simplibuy/cart/domain/usecases/cart_list_usecase.dart';
import '../../../core/state/state.dart';

class CartListController extends GetxController {
  final CartListUsecase usecase;

  CartListController({required this.usecase});

  final RxList<ItemCartDetails> _cartItems = (List<ItemCartDetails>.of([])).obs;
  final RxDouble _totalPriceInCart = 0.0.obs;

  List<ItemCartDetails> get cartItems => _cartItems.value;
  double get totalPriceInCart => _totalPriceInCart.value;
  double get totalPrice => _totalPriceInCart.value + charges;
  final double charges = 200;

  final _state = const State().obs;
  State get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    getAllItemsInCart();
  }

  Future<void> getAllItemsInCart() async {
    _state.value = LoadingState();
    var result = await usecase.getItemsInCart();
    result.fold((left) => _state.value = ErrorState(errorType: left.error),
        (right) {
      _cartItems.value = right.value;
      _updatePrice();
      _state.value = FinishedState();
    });
  }

  _updatePrice() {
    _totalPriceInCart.value = 0.0;
    for (var element in _cartItems) {
      _totalPriceInCart.value += element.totalPrice;
    }
    _state.value = FinishedState();
  }

  _addToPrice(double value) {
    _totalPriceInCart.value += value;
  }

  _subtractFromPrice(double value) {
    _totalPriceInCart.value -= value;
  }

  updateNumberOfItemsHigher(int position) {
    var singleItem = _cartItems.value[position];
    ++singleItem.itemPieces;
    _cartItems.refresh();
    usecase.updateNumberOfItemsInCart(singleItem.itemPieces, singleItem);
    _addToPrice(singleItem.itemPrice);
  }

  updateNumberOfItemsLower(int position) {
    var singleItem = _cartItems.value[position];
    if (singleItem.itemPieces == 1) {
      deleteCartItem(position);
    } else {
      --singleItem.itemPieces;
      _cartItems.refresh();
      usecase.updateNumberOfItemsInCart(singleItem.itemPieces, singleItem);
      _subtractFromPrice(singleItem.itemPrice);
    }
  }

  deleteCartItem(int position) {
    usecase.deleteCartItem(_cartItems.value[position].id as int);
    _cartItems.value.removeAt(position);
    _cartItems.refresh();
    _subtractFromPrice(_cartItems.value[position].totalPrice);
  }

  startShopping() {}
}
