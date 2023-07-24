import 'package:equatable/equatable.dart';

abstract class StatusPesananState extends Equatable {
  const StatusPesananState();

  @override
  List<Object?> get props => [];
}
class StatusPesananInitial extends StatusPesananState {}
class StatusPesananLoading extends StatusPesananState {}
class StatusPesananLoaded extends StatusPesananState {
  final menungguKonfirmasiList;
  final seleseiList;

  const StatusPesananLoaded(this.menungguKonfirmasiList, this.seleseiList);
  // @override
  // List<Object?> get props => [mList];
}
class StatusPesananError extends StatusPesananState {
  final String message;
  const StatusPesananError(this.message);
}