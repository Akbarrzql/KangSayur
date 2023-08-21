import 'package:equatable/equatable.dart';

abstract class ChatListState extends Equatable {
  const ChatListState();

  @override
  List<Object?> get props => [];
}
class ChatListInitial extends ChatListState {}
class ChatListLoading extends ChatListState {}
class ChatListLoaded extends ChatListState {
  final chatList;

  ChatListLoaded(this.chatList);

// @override
// List<Object?> get props => [mList];
}
class ChatListError extends ChatListState {
  final String message;
  const ChatListError(this.message);
}