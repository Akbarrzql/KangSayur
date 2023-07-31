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
  final disiapkanList;
  final diantarList;
  final seleseiList;

  const StatusPesananLoaded(this.menungguKonfirmasiList, this.disiapkanList,
      this.diantarList, this.seleseiList);
// @override
// List<Object?> get props => [mList];
}

class StatusPesananError extends StatusPesananState {
  final String message;

  const StatusPesananError(this.message);
}
