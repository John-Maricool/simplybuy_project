import 'package:floor/floor.dart';
import 'package:simplibuy/to_buy_list/data/model/to_buy_model.dart';

@dao
abstract class ToBuyModelDao {
  @Query('SELECT * FROM ToBuyModel')
  Future<List<ToBuyModel>> getAllItemsToBuy();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewItemsToBuy(ToBuyModel model);

  @Query('DELETE FROM ToBuyModel WHERE id = :id')
  Future<void> deleteItemToBuy(int id);

  @Query('UPDATE ToBuyModel SET item = :newValue WHERE id = :id')
  Future<void> updateNewItemToBuy(int id, String newValue);

  @Query('UPDATE ToBuyModel SET isBought = :isBought WHERE id = :id')
  Future<void> changeIsBought(int id, bool isBought);
}
