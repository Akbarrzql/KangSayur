
import 'package:equatable/equatable.dart';

abstract class ProductSaleState extends Equatable {
  ProductSaleState();

  @override
  List<Object> get props => [];
}

class ProductSaleInitial extends ProductSaleState {}

class ProductSaleLoading extends ProductSaleState {}

class ProductSaleLoaded extends ProductSaleState {
  final productSale;

  ProductSaleLoaded(this.productSale);
}

class ProductSaleError extends ProductSaleState {
  final String message;
  ProductSaleError(this.message);
}
