import 'package:equatable/equatable.dart';
abstract class ProdukTerlarisEvent extends Equatable {
  const ProdukTerlarisEvent();

  @override
  List<Object> get props => [];
}

class GetProdukTerlarisList extends ProdukTerlarisEvent{}
