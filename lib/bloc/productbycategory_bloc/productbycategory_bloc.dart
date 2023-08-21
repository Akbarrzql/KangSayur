import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'productbycategory_states.dart';
import 'productbycategory_event.dart';
class ProductByCategoryBloc extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  ProductByCategoryBloc() : super(ProductByCategoryInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetProductByCategoryList>((event, emit) async {
      try {
        emit(ProductByCategoryLoading());
        final mList = await _apiRepository.getProductByCategoryList(event.id);
        emit(ProductByCategoryLoaded(mList));
      } on NetworkError {
        emit(ProductByCategoryError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}