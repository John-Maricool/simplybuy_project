import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import 'package:simplibuy/buyer_home/domain/usecases/stores_and_malls_usecase.dart';
import '../../../core/state/state.dart';

class StoresAndMallsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getStores();
  }

  final StoresAndMallsUsecase usecase;

  StoresAndMallsController({required this.usecase});

  final RxBool _isStore = true.obs;
  bool get isStore => _isStore.value;

  final RxList<StoreDetails> _details = (List<StoreDetails>.of([])).obs;

  // ignore: invalid_use_of_protected_member
  List<StoreDetails> get details => _details.value;

  final _state = const State().obs;
  State get state => _state.value;

  void _toggleIsStore() {
    _isStore.value = true;
  }

  void _toggleIsMall() {
    _isStore.value = false;
  }

  Future<void> getStores() async {
    _toggleIsStore();
    _state.value = LoadingState();
    final result = await usecase.getStores();
    if (result.isLeft) {
      _state.value = const ErrorState(errorMessage: "Error");
    } else {
      _details.value = result.right.value;
      _state.value = FinishedState();
    }
  }

  Future<void> getMalls() async {
    _toggleIsMall();
    _state.value = LoadingState();
    final result = await usecase.getMalls();
    if (result.isLeft) {
      _state.value = const ErrorState(errorMessage: "Error");
    } else {
      _details.value = result.right.value;
      _state.value = FinishedState();
    }
  }
}
