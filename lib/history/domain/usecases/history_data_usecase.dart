import 'package:either_dart/either.dart';
import 'package:simplibuy/history/domain/repositories/history_data_repo.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';
import '../entities/history_data.dart';

class HistoryDataUsecase {
  final HistoryDataRepo _repo;

  HistoryDataUsecase(this._repo);

  getHistoryData(
      Function(Either<Failure, Result<List<HistoryData>>> b) res) async {
    await _repo.getHistoryData().then((value) => res.call(value));
  }
}
