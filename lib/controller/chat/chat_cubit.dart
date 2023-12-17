import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kotobekia/models/conversation_model/conversation_model.dart';
import 'package:kotobekia/models/user_model/user_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  int checkedTypeChat=1;
  void chooseTypeChat(int check){
    checkedTypeChat=check;
    emit(ChangeCheckTypeChatState());
  }

  ConversationModel ?conversationModel;
  List<Users>users=[];
  void getUsersConversation({
    required String token,
  }) async {
    emit(LoadingUsersConversationState());
    try {
      final Response response = await DioHelper.getData(
          url: ApiConstant.getConversation,
          token: token
      );
      Map<String, dynamic> responseData = response.data;
      conversationModel = ConversationModel.fromJson(responseData);
      users.addAll(conversationModel!.conversations!.map((e) {
        print(e.users![0].sId);
        return (e.users![0].sId != '6574e05d85cd0da73fdaba95') ? e.users![0] : e.users![1];
      }).toList());
     print(users);
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
}
