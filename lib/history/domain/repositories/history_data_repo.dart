import 'package:either_dart/either.dart';
import 'package:simplibuy/core/failure/failure.dart';
import 'package:simplibuy/core/result/result.dart';
import 'package:simplibuy/history/domain/entities/history_data.dart';

import 'package:simplibuy/core/network/network_info.dart';
import '../../../core/error_types/error_types.dart';

abstract class HistoryDataRepo {
  Future<Either<Failure, Result<List<HistoryData>>>> getHistoryData();
}

class HistoryDataImpl implements HistoryDataRepo {
  final NetworkInfo _networkInfo;

  HistoryDataImpl(this._networkInfo);
  @override
  Future<Either<Failure, Result<List<HistoryData>>>> getHistoryData() async {
    if (await _networkInfo.isConnected) {
      try {
        if (data.isEmpty) {
          return Left(Failure(error: EmptyListError()));
        }
        return Right(Result(value: data));
      } on Exception {
        return Left(Failure(error: ServerError()));
      }
    } else {
      return Left(Failure(error: InternetError()));
    }
  }

  var data = [
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
    HistoryData('purchaseId', 'status', 1231, 'time'),
  ];
}
