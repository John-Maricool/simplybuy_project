import 'dart:core';

import 'package:floor/floor.dart';

@entity
class ItemToBuy {
  @PrimaryKey(autoGenerate: false)
  int id;
  String item;
  bool isBought = false;

  ItemToBuy({required this.id, required this.item, required this.isBought});
}
