
import 'package:equatable/equatable.dart';
abstract class JsonEvent extends Equatable {
  const JsonEvent();

  @override
  List<Object> get props => [];
}

class GetProfileList extends JsonEvent {}
class GetProductMostPopularList extends JsonEvent {}
class GetProductUserMostVisitList extends JsonEvent {}
class GetNearestTokoList extends JsonEvent{}
class GetDetailProductList extends JsonEvent{
  final int id;
  const GetDetailProductList(this.id);
}

