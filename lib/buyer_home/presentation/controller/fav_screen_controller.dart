import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import '../../../core/state/state.dart';
import '../../domain/usecases/stores_and_malls_fav_usecase.dart';

class FavScreenController extends GetxController {
  final StoresAndMallsFavUsecase usecase;

  FavScreenController({required this.usecase});

  final RxList<StoreDetails> _details = (List<StoreDetails>.of([])).obs;

  // ignore: invalid_use_of_protected_member
  List<StoreDetails> get details => _details.value;

  final _state = const State().obs;
  State get state => _state.value;

  Future<void> getFavorites() async {
    _state.value = LoadingState();
    final result = await usecase.getAllFavoriteStoresAndMalls();
    if (result.isLeft) {
      _state.value = ErrorState(errorType: result.left.error);
    } else {
      _details.value = result.right.value;
      _state.value = FinishedState();
    }
  }

  removeFromFav(int id) {
    var store = details[id];
    usecase.removeStoreFromFavorite(details[id].id);
    details.remove(store);
    _details.refresh();
  }
}
