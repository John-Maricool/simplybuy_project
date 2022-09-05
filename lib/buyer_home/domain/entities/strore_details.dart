import 'package:equatable/equatable.dart';

class StoreDetails extends Equatable {
  final String name;
  final String location;
  final String address =
      "32, Olorunsogo street Ejigbo 32, Olorunsogo street Ejigbo32, Olorunsogo street Ejigbo";
  final String imageLogo = "";
  final int ratings = 0;

  const StoreDetails({required this.name, required this.location});

  @override
  List<Object?> get props => [name, location, address, imageLogo, ratings];
}
