import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/chat/chat_cubit.dart';

import '../styles/colors.dart';

class BuildCheckTypeChat extends StatelessWidget {
  final TextTheme font;
  final double w;
  final double h;
  final String text;
  final int numberOfMessage;
  final int numberOfChecked;
  final ChatCubit cubit;
  const BuildCheckTypeChat({super.key,
    required this.h,
    required this.cubit,
    required this.numberOfChecked,
    required this.numberOfMessage,
    required this.w,
    required this.font,
    required this.text});

  @override
  Widget build(BuildContext context) {
        return InkWell(
          onTap: () {
            cubit.chooseTypeChat(numberOfChecked);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(text,
                      style: font.bodyLarge!
                          .copyWith(fontSize: w / 27, fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width:14.w,
                    height:14.h,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(w / 90)),
                    child: Text('${numberOfMessage>9?'9+':numberOfMessage}',
                        style: font.titleSmall!
                            .copyWith(color: Colors.white, fontSize: w / 34)),
                  )
                ],
              ),

              SizedBox(
                height: 5.h,
              ),
              if(numberOfChecked==cubit.checkedTypeChat)
                Container(
                  width: 42.w,
                  height: 3.h,
                  color: ColorConstant.primaryColor,
                )

            ],
          ),
        );
  }
}
