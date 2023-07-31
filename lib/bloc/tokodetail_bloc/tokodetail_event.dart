import 'package:equatable/equatable.dart';
abstract class TokoDetailEvent extends Equatable {
  const TokoDetailEvent();

  @override
  List<Object> get props => [];
}

class GetTokoDetailList extends TokoDetailEvent {
  final String id;
  const GetTokoDetailList(this.id);
}
