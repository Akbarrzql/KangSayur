import 'package:equatable/equatable.dart';

abstract class JsonState extends Equatable {
  const JsonState();

  @override
  List<Object?> get props => [];
}
class JsonInitial extends JsonState {}
class JsonLoading extends JsonState {
}
class JsonLoaded extends JsonState {
  final jsonProfile;
  final jsonProductMostPopular;
  final jsonProductUserMostVisit;
  final jsonNearestToko;
  final jsonDetailProduct;
  final jsonSearchProduct;
  final jsonTokoPopular;
  final jsonCartProduct;
  final jsonCheckout;
  final jsonSubTotalCart;
  const JsonLoaded(this.jsonProfile, this.jsonProductMostPopular, this.jsonProductUserMostVisit, this.jsonNearestToko, this.jsonDetailProduct, this.jsonSearchProduct, this.jsonTokoPopular, this.jsonCartProduct, this.jsonCheckout, this.jsonSubTotalCart);
  // @override
  // List<Object?> get props => [jsonProfile];
}
class JsonError extends JsonState {
  final String message;
  const JsonError(this.message);
}