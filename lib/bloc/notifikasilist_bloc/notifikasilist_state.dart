import 'package:equatable/equatable.dart';

abstract class NotifikasiListState extends Equatable {
  const NotifikasiListState();

  @override
  List<Object?> get props => [];
}
class NotifikasiListInitial extends NotifikasiListState {}
class NotifikasiListLoading extends NotifikasiListState {}
class NotifikasiListLoaded extends NotifikasiListState {
  final notifikasiList;

  NotifikasiListLoaded(this.notifikasiList);

// @override
// List<Object?> get props => [mList];
}
class NotifikasiListError extends NotifikasiListState {
  final String message;
  const NotifikasiListError(this.message);
}