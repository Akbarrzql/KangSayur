import 'package:equatable/equatable.dart';

abstract class ProdukTerlarisState extends Equatable {
  const ProdukTerlarisState();

  @override
  List<Object?> get props => [];
}
class ProdukTerlarisInitial extends ProdukTerlarisState {}
class ProdukTerlarisLoading extends ProdukTerlarisState {}
class ProdukTerlarisLoaded extends ProdukTerlarisState {
  final produkterlaris;

  ProdukTerlarisLoaded(this.produkterlaris);

// @override
// List<Object?> get props => [mList];
}
class ProdukTerlarisError extends ProdukTerlarisState {
  final String message;
  const ProdukTerlarisError(this.message);
}