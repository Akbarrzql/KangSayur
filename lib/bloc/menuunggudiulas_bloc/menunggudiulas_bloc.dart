import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'menunggudiulas_event.dart';
import 'menunggudiulas_state.dart';

class MenungguDiulasBloc extends Bloc<MenungguDiulasEvent, MenungguDiulasState> {
  MenungguDiulasBloc() : super(MenungguDiulasInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetMenungguDiulasList>((event, emit) async {
      try {
        emit(MenungguDiulasLoading());
        final mList = await _apiRepository.getMenungguDiulasList();
        emit(MenungguDiulasLoaded(mList));
      } on NetworkError {
        emit(MenungguDiulasError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}