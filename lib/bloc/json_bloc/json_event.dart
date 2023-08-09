
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
class GetSearchProductList extends JsonEvent{
  final String keyword;
  const GetSearchProductList(this.keyword);
}

class GetTokoPopularList extends JsonEvent{}
class GetCartProductList extends JsonEvent{}
class GetCheckoutList extends JsonEvent{
  final int alamatId;
  const GetCheckoutList(this.alamatId);
}
class GetSubTotalCartList extends JsonEvent{}

