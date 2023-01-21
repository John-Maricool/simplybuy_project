import 'package:either_dart/either.dart';
import 'package:simplibuy/core/failure/failure.dart';
import 'package:simplibuy/core/result/result.dart';
import 'package:simplibuy/history/domain/entities/history_data.dart';

abstract class HistoryDataRepo {
  Future<Either<Failure, Result<List<HistoryData>>>> getHistoryData();
}
