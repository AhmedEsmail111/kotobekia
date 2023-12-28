import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/chat/chat_cubit.dart';
import 'package:kotobekia/models/message_model/message_model.dart';
import 'package:kotobekia/shared/component/authentication/gender_row_in_auth.dart';
import 'package:kotobekia/shared/component/divider_line.dart';
import 'package:kotobekia/shared/component/item_for_user_in_chat.dart';
import 'package:kotobekia/shared/component/text_in_message.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';
import 'package:kotobekia/shared/network/remote/socket.io.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../shared/component/user_row_in_message.dart';

class MessageScreen extends StatefulWidget {
  final int index;
  final String name;
  final bool male;
  final String convId;
  const MessageScreen({super.key
    ,required this.index,
    required this.convId,
    required this.name,
    required this.male,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {


  io.Socket? socket;
  void initState() {
    getMessage(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzRlMDVkODVjZDBkYTczZmRhYmE5NSIsImZ1bGxOYW1lIjoibG9sbyIsImVtYWlsIjoibG9sQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiZ2VuZGVyIjoibWFsZSIsImJpcnRoRGF0ZSI6IjIwMDAtMDYtMTVUMDA6MDA6MDAuMDAwWiIsImlhdCI6MTcwMjE1ODUxNX0.DZFqXXOWPD1KJEPXTHykAqPlmQ_hTQbjsRs2H6UyncA',
        id:widget.convId );
    initSocketIO();
  }

  void getMessage({
    required String token,
    required String id
  }) async {

      final Response response = await DioHelper.getData(
        url: ApiConstant.getMessage(id),
        token: token,
      );
      List<dynamic> responseData = response.data;
      responseData.forEach((element) {
        messageModel = MessageModel.fromJson(element);
        messages.add([messageModel!.message!,messageModel!.sender!.sId!,messageModel!.createdAt!]);
      });
      print(messages);
      setState(() {
      });
  }
  initSocketIO(){
    socket = io.io('https://kotobekia-back.onrender.com',
        <String, dynamic>{
          "transports": ["websocket"],
          "autoConnect": false
        });
    socket!.connect();
    socket!.onConnect((id) {
      socket!.on("get-online-users", (data) {
        print(data);
      });

    });

    socket!.onDisconnect((_) {
      print('Disconnected from the socket server');
    });

    socket?.emit("join", '6574e05d85cd0da73fdaba95');

    //subscribe event
    socket!.on('receive-message', (data) {
      _getMessage(data);
      setState(() {
        print(messages.last);
      });
    });

  }
  MessageModel ?messageModel;
  void sendMessage({
    required String conversationId,
    required String message,
    required String token
  }) async {
      final Response response = await DioHelper.postData(
          url: ApiConstant.sendMessage,
          token: token,
          data: {
            "convo_id" : conversationId,
            "message":message
          });
      Map<String, dynamic> responseData = response.data;
      messageModel = MessageModel.fromJson(responseData);
      messages.add([message,'6574e05d85cd0da73fdaba95',messageModel!.createdAt!]);
      _sendMsg(responseData);
      setState(() {

      });
  }

  void _sendMsg(dynamic messageModel) {
    socket!.emit('send-message', messageModel);
  }
  void _getMessage(dynamic data){
    setState(() {
      MessageModel messageModel=MessageModel.fromJson(data);
      messages.add([messageModel.message!,messageModel.sender!.sId!
        ,messageModel.createdAt!]);


    });
  }


  @override
  Widget build(BuildContext context) {
    var messageController=TextEditingController();
    TextTheme font = Theme.of(context).textTheme;
    final ScrollController controller = ScrollController();
    final locale = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Material(
                elevation: 4,
                shadowColor: Colors.black.withOpacity(0.25),
                child: Container(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 35.h),
                  color: Colors.white,
                  height: 155.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      BuildUserRowInMessage(name: widget.name, font: font,male:widget.male),
                      SizedBox(
                        height: 9.h,
                      ),
                      const BuildDividerLine(
                        thickness: 1,
                      ),
                      BuildItemForUserInChat(
                          font: font,
                          image:
                          'https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg',
                          price: 'مجانا',
                          title: 'مجموعة كتب الاضواء',
                          category: ' كتب مستعملة الاضواء الصف الثالث الاعدادي')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView.separated
                    (
                      physics: const ScrollPhysics(),
                      controller: controller,
                      shrinkWrap: true,

                      itemBuilder:
                      (context, index) {
                    return  BuildTextMessage(
                      date:messages[index][2],
                        font: font, text: messages[index].first,
                        sender:messages[index][1]=='6574e05d85cd0da73fdaba95'?
                        true:false);
                  },
                      separatorBuilder: (context, index) =>  SizedBox(
                        height: 15.h,
                      ),
                      itemCount: messages.length),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 160.h,  // Set a specific maximum height for the container
                ),
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: font.titleMedium,
                        controller:messageController,
                        maxLines:null,
                        // Allow the TextFormField to have multiple lines
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                          fillColor: ColorConstant.midGrayColor,
                          filled: true,
                          hintText: locale!.message_placeholder,
                          hintStyle: font.displayMedium!.copyWith(fontSize: 12.sp),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Icon(SolarIconsOutline.gallery,
                                color: ColorConstant.primaryColor, size: 24.w),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Transform.scale(
                      scaleX: -1,
                      child: InkWell(
                        onTap: (){
                          sendMessage(conversationId:widget.convId,
                              message: messageController.text,
                              token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzRlMDVkODVjZDBkYTczZmRhYmE5NSIsImZ1bGxOYW1lIjoibG9sbyIsImVtYWlsIjoibG9sQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiZ2VuZGVyIjoibWFsZSIsImJpcnRoRGF0ZSI6IjIwMDAtMDYtMTVUMDA6MDA6MDAuMDAwWiIsImlhdCI6MTcwMjE1ODUxNX0.DZFqXXOWPD1KJEPXTHykAqPlmQ_hTQbjsRs2H6UyncA');

                          messageController.clear();
                        },
                        child: Icon(SolarIconsOutline.plain2,
                            size: 24.w, color: ColorConstant.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );


  }
}
