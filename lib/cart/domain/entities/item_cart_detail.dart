import 'package:floor/floor.dart';

@entity
class ItemCartDetails {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String storeName;
  final int storeId;
  final String itemName;
  int itemPieces;
  final double itemPrice;

  double get totalPrice => itemPieces * itemPrice;

  ItemCartDetails(
      {this.id,
      required this.storeName,
      required this.storeId,
      required this.itemName,
      required this.itemPieces,
      required this.itemPrice});
}
