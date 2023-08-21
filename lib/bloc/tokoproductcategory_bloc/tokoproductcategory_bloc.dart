import 'package:flutter_bloc/flutter_bloc.dart';

import '../../API/resource/api_repository.dart';
import 'tokoproductcategory_state.dart';
import 'tokoproductcategory_event.dart';

class TokoProductCategoryBloc
    extends Bloc<TokoProductCategoryEvent, TokoProductCategoryState> {
  TokoProductCategoryBloc() : super(TokoProductCategoryInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetTokoProductCategoryList>((event, emit) async {
      try {
        emit(TokoProductCategoryLoading());
        final mList = await _apiRepository.getTokoProductCategoryList(event.kategoriId, event.Tokoid);
        emit(TokoProductCategoryLoaded(mList));
      } on NetworkError {
        emit(TokoProductCategoryError(
            "Couldn't fetch data. Is the device online?"));
      }
    });
  }
}
