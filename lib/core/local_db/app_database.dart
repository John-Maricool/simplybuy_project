import 'dart:async';
import 'package:floor/floor.dart';
import 'package:simplibuy/core/failure/failure.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import 'package:simplibuy/core/local_db/cart_dao.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ItemCartDetails])
abstract class AppDatabase extends FloorDatabase {
  static Future<AppDatabase>? _instance;
  CartDao get cartDao;

  static Future<Future<AppDatabase>?> getDb() async {
    _instance ??= $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return _instance;
  }
}
