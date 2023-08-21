import 'package:equatable/equatable.dart';
import 'package:kangsayur/model/roomchatmodel.dart';

abstract class RoomChatState extends Equatable {
  const RoomChatState();

  @override
  List<Object?> get props => [];
}
class RoomChatInitial extends RoomChatState {}
class RoomChatLoading extends RoomChatState {}
class RoomChatLoaded extends RoomChatState {
  final RoomChatModel roomChat;

  RoomChatLoaded(this.roomChat);

// @override
// List<Object?> get props => [mList];
}
class RoomChatError extends RoomChatState {
  final String message;
  const RoomChatError(this.message);
}