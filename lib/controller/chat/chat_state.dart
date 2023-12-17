part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChangeCheckTypeChatState extends ChatState {}


class LoadingUsersConversationState extends ChatState {}

class SuccessUsersConversationState extends ChatState {
  final ConversationModel userModel;

  SuccessUsersConversationState(this.userModel);
}

class FailedUsersConversationState extends ChatState {
  final String error;

  FailedUsersConversationState(this.error);
}
