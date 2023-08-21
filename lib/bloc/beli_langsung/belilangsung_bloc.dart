import 'package:flutter_bloc/flutter_bloc.dart';

import '../../API/resource/api_repository.dart';
import '../../model/checkoutbuymodel.dart';
import 'belilangsung_event.dart';
import 'belilangsung_states.dart';


class BeliLangsungBloc extends Bloc<BeliLangsungEvent, BeliLangsungState> {
  late CheckoutBuyModel data;
  final ApiRepository _apiRepository = ApiRepository();

  BeliLangsungBloc() : super(BeliLangsungInitial()) {
    on<BeliLangsungEvent>((event, emit) async {
      if (event is SendData ){
        emit(BeliLangsungLoading());
        await Future.delayed(Duration(seconds: 3), () async {
          try {
            data = await _apiRepository.postCheckoutBuy(event.alamatId, event.tokoId, event.produkId, event.variantId, event.jumlahBeli);
            emit(BeliLangsungLoaded(data));
          } on NetworkError {
            emit(BeliLangsungError("Couldn't fetch data. Is the device online?"));
          }
        });
      }
    });
  }
}