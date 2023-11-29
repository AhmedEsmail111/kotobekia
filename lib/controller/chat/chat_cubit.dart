import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  int checkedTypeChat=1;
  void chooseTypeChat(int check){
    checkedTypeChat=check;
    emit(ChangeCheckTypeChatState());
  }
}
