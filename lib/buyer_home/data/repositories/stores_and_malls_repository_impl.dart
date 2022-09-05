import 'package:either_dart/either.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import 'package:simplibuy/buyer_home/domain/repositories/stores_and_malls_list_repository.dart';
import 'package:simplibuy/core/network/network_info.dart';
import 'package:simplibuy/core/result/result.dart';
import 'package:simplibuy/core/failure/failure.dart';

class StoresAndMallsRepositoryImpl extends StoresAndMallsRepository {
  final NetworkInfo networkInfo;

  StoresAndMallsRepositoryImpl(this.networkInfo);
  @override
  Future<Either<Failure, Result<List<StoreDetails>>>> getMalls() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(Result(value: malls));
      } on Exception {
        return const Left(Failure());
      }
    } else {
      return const Left(Failure());
    }
  }

  List<StoreDetails> stores = const <StoreDetails>[
    StoreDetails(name: 'Shoprite Stores', location: "New Haven, Enugu"),
    StoreDetails(name: 'Roban Stores', location: "Old Haven, Enugu"),
    StoreDetails(name: 'Spar Stores', location: "New Haven, Enugu"),
    StoreDetails(name: 'Shoprite Stores', location: "New Haven, Enugu"),
    StoreDetails(name: 'Shoprite Stores', location: "New Haven, Enugu"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
  ];

  List<StoreDetails> malls = const <StoreDetails>[
    StoreDetails(name: 'Shoprite Mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Roban Mall', location: "Old Haven, Enugu"),
    StoreDetails(name: 'Spar mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Shoprite Mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Shoprite Mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
  ];

  @override
  Future<Either<Failure, Result<List<StoreDetails>>>> getStores() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(Result(value: stores));
      } on Exception {
        return const Left(Failure());
      }
    } else {
      return const Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Result<List<StoreDetails>>>> searchStoreOrMall(
      String query) {
    // TODO: implement searchStoreOrMall
    throw UnimplementedError();
  }
}
