
import 'package:intl/intl.dart';
import 'package:kotobekia/controller/chat/chat_cubit.dart';
import 'package:kotobekia/models/message_model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
List<List<String>>messages=[];

class SocketIO {
  io.Socket? socket;
  MessageModel ?messageModel;
  SocketIO();
  void connect() {

  }

  void sendMsg(dynamic messageModel) {
      socket!.emit('send-message', messageModel);
  }




}