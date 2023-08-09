import 'package:equatable/equatable.dart';
abstract class IklanEvent extends Equatable {
  const IklanEvent();

  @override
  List<Object> get props => [];
}

class GetIklanList extends IklanEvent{}
