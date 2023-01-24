import 'dart:core';

import 'package:floor/floor.dart';

@entity
class ToBuyModel {
  @PrimaryKey(autoGenerate: false)
  int id;
  String item;
  bool isBought = false;

  ToBuyModel({required this.id, required this.item, required this.isBought});
}
