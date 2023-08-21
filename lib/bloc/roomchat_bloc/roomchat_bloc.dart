import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'roomchat_event.dart';
import 'roomchat_state.dart';

class RoomChatBloc extends Bloc<RoomChatEvent, RoomChatState> {
  RoomChatBloc() : super(RoomChatInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetRoomChatList>((event, emit) async {
      try {
        emit(RoomChatLoading());
        final mList = await _apiRepository.getRoomChatList(event.roomId);
        emit(RoomChatLoaded(mList));
      } on NetworkError {
        emit(RoomChatError("Couldn't fetch data. Is the device online?"));
      }
    });
  }
}
