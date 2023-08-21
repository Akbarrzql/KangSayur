import 'package:equatable/equatable.dart';
abstract class RoomChatEvent extends Equatable {
  const RoomChatEvent();

  @override
  List<Object> get props => [];
}

class GetRoomChatList extends RoomChatEvent{
  final String roomId;
  const GetRoomChatList(this.roomId);
}