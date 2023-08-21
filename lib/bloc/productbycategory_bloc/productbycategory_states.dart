import 'package:equatable/equatable.dart';

abstract class ProductByCategoryState extends Equatable {
  const ProductByCategoryState();

  @override
  List<Object?> get props => [];
}
class ProductByCategoryInitial extends ProductByCategoryState {}
class ProductByCategoryLoading extends ProductByCategoryState {}
class ProductByCategoryLoaded extends ProductByCategoryState {
  final produkByCategory;

  ProductByCategoryLoaded(this.produkByCategory);

// @override
// List<Object?> get props => [mList];
}
class ProductByCategoryError extends ProductByCategoryState {
  final String message;
  const ProductByCategoryError(this.message);
}