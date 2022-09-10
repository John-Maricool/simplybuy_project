import 'package:get/get.dart';

class BuyerHomeNavigationController extends GetxController {
  final RxInt _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  changePage(int page) {
    _currentPage.value = page;
  }
}
