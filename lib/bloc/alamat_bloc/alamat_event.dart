import 'package:equatable/equatable.dart';
abstract class AlamatEvent extends Equatable {
  const AlamatEvent();

  @override
  List<Object> get props => [];
}

class GetAlamatList extends AlamatEvent{}
