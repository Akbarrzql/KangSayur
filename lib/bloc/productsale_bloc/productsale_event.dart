import 'package:equatable/equatable.dart';
abstract class ProductSaleEvent extends Equatable {
  const ProductSaleEvent();

  @override
  List<Object> get props => [];
}

class GetProductSaleList extends ProductSaleEvent{}
