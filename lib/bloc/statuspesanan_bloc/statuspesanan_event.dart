import 'package:equatable/equatable.dart';
abstract class StatusPesananEvent extends Equatable {
  const StatusPesananEvent();

  @override
  List<Object> get props => [];
}

class GetStatusPesananKonfirmasiList extends StatusPesananEvent {}
class GetStatusPesananDisiapkanList extends StatusPesananEvent {}
class GetStatusPesananDiantarList extends StatusPesananEvent {}
class GetStatusPesananSelesaiList extends StatusPesananEvent {}
