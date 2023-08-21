import 'package:equatable/equatable.dart';

abstract class IklanHomeState extends Equatable {
  const IklanHomeState();

  @override
  List<Object?> get props => [];
}
class IklanHomeInitial extends IklanHomeState {}
class IklanHomeLoading extends IklanHomeState {}
class IklanHomeLoaded extends IklanHomeState {
  final iklan;

  IklanHomeLoaded(this.iklan);

// @override
// List<Object?> get props => [mList];
}
class IklanHomeError extends IklanHomeState {
  final String message;
  const IklanHomeError(this.message);
}