import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import 'package:simplibuy/buyer_home/domain/usecases/stores_and_malls_usecase.dart';
import 'package:simplibuy/to_buy_list/data/model/to_buy_model.dart';
import 'package:simplibuy/to_buy_list/domain/usecases/to_buy_usecase.dart';
import '../../../core/state/state.dart';
import '../../domain/usecases/stores_and_malls_fav_usecase.dart';

class StoresAndMallsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getStores();
  }

  final StoresAndMallsUsecase usecase;
  // ignore: non_constant_identifier_names
  final StoresAndMallsFavUsecase usecaseFav;
  final ToBuyUsecase usecaseToBuy;

  StoresAndMallsController(
      {required this.usecase,
      required this.usecaseFav,
      required this.usecaseToBuy});

  final RxBool _isStore = true.obs;
  bool get isStore => _isStore.value;

  final RxList<StoreDetails> _details = (List<StoreDetails>.of([])).obs;
  final RxList<ToBuyModel> _toBuyModel = (List<ToBuyModel>.of([])).obs;

  // ignore: invalid_use_of_protected_member
  List<StoreDetails> get details => _details.value;
  // ignore: invalid_use_of_protected_member
  List<ToBuyModel> get toBuyModel => _toBuyModel.value;

  final _state = const State().obs;
  State get state => _state.value;

  final _stateToBuy = const State().obs;
  State get stateToBuy => _stateToBuy.value;

  List<RxBool> isBoughtRx = [];

  void _toggleIsStore() {
    _isStore.value = true;
  }

  void _toggleIsMall() {
    _isStore.value = false;
  }

  void reload() {
    if (_isStore.isTrue) {
      getStores();
    } else {
      getMalls();
    }
  }

  getStores() {
    _toggleIsStore();
    _state.value = LoadingState();
    usecase.getStores().then((value) {
      if (value.isLeft) {
        _state.value = ErrorState(errorType: value.left.error);
      } else {
        _details.value = value.right.value;
        _state.value = FinishedState();
      }
    });
  }

  addToFav(int position) {
    usecaseFav.addStoreToFavorite(details[position]);
  }

  getMalls() {
    _toggleIsMall();
    _state.value = LoadingState();
    usecase.getMalls().then((value) {
      if (value.isLeft) {
        _state.value = ErrorState(errorType: value.left.error);
      } else {
        _details.value = value.right.value;
        _state.value = FinishedState();
      }
    });
  }

  getToBuyList() async {
    _stateToBuy.value = LoadingState();
    usecaseToBuy.getAllItemsToBuy((result) {
      if (result.isLeft) {
        _stateToBuy.value = ErrorState(errorType: result.left.error);
      } else {
        _toBuyModel.value = result.right.value;
        isBoughtRx = result.right.value.map((e) => RxBool(e.isBought)).toList();
        _stateToBuy.value = FinishedState();
      }
    });
  }

  saveIsBought(int index) async {
    final valuess = isBoughtRx[index];
    final iid = _toBuyModel[index].id;
    await usecaseToBuy.changeIsBought(iid, valuess.value);
  }
}
