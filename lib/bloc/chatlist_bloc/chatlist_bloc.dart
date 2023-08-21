import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'chatlist_event.dart';
import 'chatlist_states.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetChatListList>((event, emit) async {
      try {
        emit(ChatListLoading());
        final mList = await _apiRepository.getChatListList();
        emit(ChatListLoaded(mList));
      } on NetworkError {
        emit(ChatListError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}