import 'package:equatable/equatable.dart';

abstract class TokoDetailState extends Equatable {
  const TokoDetailState();

  @override
  List<Object?> get props => [];
}
class TokoDetailInitial extends TokoDetailState {}
class TokoDetailLoading extends TokoDetailState {}
class TokoDetailLoaded extends TokoDetailState {
  final tokoDetailList;

  TokoDetailLoaded(this.tokoDetailList);

// @override
// List<Object?> get props => [mList];
}
class TokoDetailError extends TokoDetailState {
  final String message;
  const TokoDetailError(this.message);
}