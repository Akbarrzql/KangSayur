import 'package:equatable/equatable.dart';
abstract class StatusPesananEvent extends Equatable {
  const StatusPesananEvent();

  @override
  List<Object> get props => [];
}

class GetStatusPesananAllList extends StatusPesananEvent {}
class GetStatusPesananSelesaiList extends StatusPesananEvent {}
