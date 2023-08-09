import 'package:equatable/equatable.dart';

abstract class IklanState extends Equatable {
  const IklanState();

  @override
  List<Object?> get props => [];
}
class IklanInitial extends IklanState {}
class IklanLoading extends IklanState {}
class IklanLoaded extends IklanState {
  final iklan;

  IklanLoaded(this.iklan);

// @override
// List<Object?> get props => [mList];
}
class IklanError extends IklanState {
  final String message;
  const IklanError(this.message);
}