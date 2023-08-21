import 'package:equatable/equatable.dart';
abstract class KategoriEvent extends Equatable {
  const KategoriEvent();

  @override
  List<Object> get props => [];
}

class GetKategoriList extends KategoriEvent{}
