import 'package:equatable/equatable.dart';
abstract class TokoProductCategoryEvent extends Equatable {
  const TokoProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetTokoProductCategoryList extends TokoProductCategoryEvent {
  final String kategoriId;
  final String Tokoid;
  const GetTokoProductCategoryList(this.kategoriId, this.Tokoid);
}
