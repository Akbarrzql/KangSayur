import 'package:equatable/equatable.dart';
import 'package:kangsayur/model/tokoproductcategorymodel.dart';

abstract class TokoProductCategoryState extends Equatable {
  const TokoProductCategoryState();

  @override
  List<Object?> get props => [];
}

class TokoProductCategoryInitial extends TokoProductCategoryState {}

class TokoProductCategoryLoading extends TokoProductCategoryState {}

class TokoProductCategoryLoaded extends TokoProductCategoryState {
  final TokoProductCategoryModel tokoProductCategoryList;

  TokoProductCategoryLoaded(this.tokoProductCategoryList);


// @override
// List<Object?> get props => [mList];
}

class TokoProductCategoryError extends TokoProductCategoryState {
  final String message;

  const TokoProductCategoryError(this.message);
}
