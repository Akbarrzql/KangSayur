import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/bloc/productsale_bloc/productsale_event.dart';
import 'package:kangsayur/bloc/productsale_bloc/productsale_state.dart';
import '../../API/resource/api_repository.dart';

class ProductSaleBloc extends Bloc<ProductSaleEvent, ProductSaleState> {
  ProductSaleBloc() : super(ProductSaleInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetProductSaleList>((event, emit) async {
      try {
        emit(ProductSaleLoading());
        final mList = await _apiRepository.getProductSaleList();
        emit(ProductSaleLoaded(mList));
      } on NetworkError {
        emit(ProductSaleError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}