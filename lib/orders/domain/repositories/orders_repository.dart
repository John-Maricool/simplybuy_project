import 'package:either_dart/either.dart';
import 'package:simplibuy/core/failure/failure.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/network/network_info.dart';
import 'package:simplibuy/core/result/result.dart';
import 'package:simplibuy/orders/data/models/accepted_orders.dart';
import 'package:simplibuy/orders/data/models/incoming_orders.dart';

abstract class OrdersRepository {
  Future<Either<Failure, Result<List<AcceptedOrders>>>> getAcceptedOrders();
  Future<Either<Failure, Result<List<IncomingOrder>>>> getIncomingOrders();
}

class OrdersRepositoryImpl implements OrdersRepository {
  final NetworkInfo networkInfo;

  OrdersRepositoryImpl(this.networkInfo);

  @override
  Future<Either<Failure, Result<List<AcceptedOrders>>>>
      getAcceptedOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final res = ordersA;
        if (res.isEmpty) {
          return Left(Failure(error: EmptyListError()));
        } else {
          return Right(Result(value: res));
        }
      } on Exception {
        return Left(Failure(error: ServerError()));
      }
    } else {
      return Left(Failure(error: InternetError()));
    }
  }

  @override
  Future<Either<Failure, Result<List<IncomingOrder>>>>
      getIncomingOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final res = orders;
        if (res.isEmpty) {
          return Left(Failure(error: EmptyListError()));
        } else {
          return Right(Result(value: res));
        }
      } on Exception {
        return Left(Failure(error: ServerError()));
      }
    } else {
      return Left(Failure(error: InternetError()));
    }
  }
}
