import 'package:equatable/equatable.dart';
abstract class NotifikasiListEvent extends Equatable {
  const NotifikasiListEvent();

  @override
  List<Object> get props => [];
}

class GetNotifikasiListList extends NotifikasiListEvent{}
