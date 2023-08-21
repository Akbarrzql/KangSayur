
import 'package:equatable/equatable.dart';
import 'package:kangsayur/model/checkoutbuymodel.dart';

abstract class BeliLangsungState extends Equatable {
   BeliLangsungState();

  @override
  List<Object> get props => [];
}

class BeliLangsungInitial extends BeliLangsungState {}

class BeliLangsungLoading extends BeliLangsungState {}

class BeliLangsungLoaded extends BeliLangsungState {
  final CheckoutBuyModel checkoutBuyModel;

   BeliLangsungLoaded(this.checkoutBuyModel);
}

class BeliLangsungError extends BeliLangsungState {
  final String message;
   BeliLangsungError(this.message);
}
