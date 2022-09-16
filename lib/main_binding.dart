import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:simplibuy/core/network/network_info.dart';
import 'core/local_db/app_database.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(NetworkInfoImpl(InternetConnectionChecker()));
    var result = Get.putAsync(
        () async => await AppDatabase.getDb() as Future<AppDatabase>);
    AppDatabase db = await result;
    Get.put(db.cartDao);
  }
}
