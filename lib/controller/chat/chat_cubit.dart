import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kotobekia/models/conversation_model/conversation_model.dart';
import 'package:kotobekia/models/message_model/message_model.dart';
import 'package:kotobekia/models/user_model/user_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:kotobekia/shared/network/remote/socket.io.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({this.messageModel}) : super(ChatInitial());
  SocketIO socketIO = SocketIO();
  void socketConnect(){
    socketIO.connect();
    emit(SuccessConnectSocketState());
  }
  int checkedTypeChat = 1;

  void chooseTypeChat(int check) {
    checkedTypeChat = check;
    emit(ChangeCheckTypeChatState());
  }

  ConversationModel? conversationModel;
  List<Users> otherUsers = [];

  void getUsersConversation({
    required String token,
  }) async {
    emit(LoadingUsersConversationState());
    try {
      final Response response = await DioHelper.getData(
          url: ApiConstant.getConversation,
      token: token);
      Map<String, dynamic> responseData = response.data;
      conversationModel = ConversationModel.fromJson(responseData);
      print(conversationModel.toString());
      otherUsers.addAll(conversationModel!.conversations!.map((e) {
        return (e.users![0].sId != '6574e05d85cd0da73fdaba95')
            ? e.users![0]
            : e.users![1];
      }).toList());
      print(otherUsers[0].sId);
      emit(SuccessUsersConversationState(conversationModel!));
    } catch (error) {
      if (error is DioError) {
        Map<String, dynamic> responseData = error.response!.data;
        conversationModel = ConversationModel.fromJson(responseData);
        print(error.response!.data.toString());
        emit(SuccessUsersConversationState(conversationModel!));
      } else {
        print(error.toString());
        emit(FailedUsersConversationState('there is Error'));
      }
    }
  }
  void newMessageReceived() {
    emit(SuccessReciveMessageSocketState());
  }

  void openUserConversation({
    required String token,
    required String receiverId
  }) async {
    emit(LoadingOpenUserConversationState());
    try {
      await DioHelper.postData(
          url: ApiConstant.openConversation,
          token: token,
          data: {
            'receiver_id':receiverId
          });
      emit(SuccessOpenUserConversationState(conversationModel!));
    } catch (error) {
      print(error.toString());
      emit(FailedOpenUserConversationState(error.toString()));
    }
  }
  MessageModel ?messageModel;


}
