import 'package:equatable/equatable.dart';
abstract class ProductByCategoryEvent extends Equatable {
  const ProductByCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductByCategoryList extends ProductByCategoryEvent{
  final String id;
  GetProductByCategoryList(this.id);
}
