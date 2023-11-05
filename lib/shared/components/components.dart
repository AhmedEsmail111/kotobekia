import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

//Row is in Authentication Screen

Widget buildRowInAuthentication(
    {required String text,
    required String textLink,
    required BuildContext context}) {
  return Row(
    children: [
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: MediaQuery.sizeOf(context).width / 30),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width / 100,
      ),
      GestureDetector(
        onTap: () {},
        child: Text(
          textLink,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: MediaQuery.sizeOf(context).width / 30,
                color: primaryColor,
                decoration: TextDecoration.underline,
              ),
        ),
      )
    ],
  );
}

//Container in OTP Screen

Widget buildOtpBoxBuilder({required BuildContext context}) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width / 5.2,
    decoration: BoxDecoration(
      color: midGrayColor,
      borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.height / 52),
    ),
    child: Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: midGrayColor,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height / 80)),
          counterText: '',
        ),
      ),
    ),
  );
}

//Default AppBar

AppBar buildDefaultAppBar({required BuildContext context}) {
  return AppBar(
    title: Row(
      children: [
        const Icon(
          SolarIconsOutline.tuning_2,
          color: Colors.black,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 40,
        ),
        const Icon(SolarIconsOutline.bell, color: iconColor),
      ],
    ),
    backgroundColor: Colors.white,
    actions: [
      Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).height / 100),
        width: MediaQuery.sizeOf(context).width / 1.4,
        child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                  right: MediaQuery.sizeOf(context).height / 100,
                ))),
      ),
    ],
  );
}

//Row Details in Post page

Widget buildRowDetialsPostPage(
    {required BuildContext context,
    required String firstText,
    required String lastText}) {
  return Row(
    children: [
      Text(
        firstText,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      Spacer(),
      Text(
        lastText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: MediaQuery.sizeOf(context).width / 30),
      ),
    ],
  );
}

// Posts

Widget buildPosts(
    {required BuildContext context,
    required String title,
    required String destination,
    required String price,
    required String image,
    required String educationLevel,
    required String location,
    required int lastTime,
    required int numberOfWatcher,
    required int numberOfbooks}) {
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width / 25),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(MediaQuery.sizeOf(context).width / 25)),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 50),
      width: MediaQuery.sizeOf(context).width / 2.37,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(MediaQuery.sizeOf(context).width / 25),
              child: Image.network(
                width: MediaQuery.sizeOf(context).width / 2.8,
                height: MediaQuery.sizeOf(context).height / 6.05,
                fit: BoxFit.cover,
                image,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).width / 29),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  destination,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).width / 30,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width / 55,
                ),
                Row(
                  children: [
                    Icon(
                      SolarIconsOutline.book,
                      size: MediaQuery.sizeOf(context).width / 25,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 55,
                    ),
                    Text(
                      '$numberOfbooks',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).width / 30,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 55,
                    ),
                    Icon(
                      SolarIconsOutline.eye,
                      size: MediaQuery.sizeOf(context).width / 25,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 55,
                    ),
                    Text(
                      '$numberOfWatcher',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).width / 30,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width / 10,
                      height: MediaQuery.sizeOf(context).height / 39,
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.sizeOf(context).width / 30)),
                      child: Text(
                        price,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: MediaQuery.sizeOf(context).width / 38,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width / 85,
                ),
                Text(
                  educationLevel,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).width / 30,
                      ),
                ),
                Row(
                  children: [
                    Icon(
                      SolarIconsOutline.mapPoint,
                      size: MediaQuery.sizeOf(context).width / 30,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 90,
                    ),
                    Text(
                      location,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).width / 30,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 55,
                    ),
                    Spacer(),
                    Icon(
                      SolarIconsOutline.clockCircle,
                      size: MediaQuery.sizeOf(context).width / 36,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 120,
                    ),
                    Text(
                      'منذ 5 ايام',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).width / 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

// Language Column

Widget buildLanguageColumn(
    {required String containerText,
    required String languageText,
    required BuildContext context}) {
  return Column(
    children: [
      Card(
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.circular(16)),
        elevation: 4,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.height / 10,
          child: Text(
            containerText,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Text(
        languageText,
        style: Theme.of(context).textTheme.titleMedium,
      )
    ],
  );
}

// Default Button

Widget buildDefaultButton(
    {required VoidCallback onTap,
    required String text,
    required Color color,
    required double elevation,
    required BuildContext context}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 17,
    width: MediaQuery.of(context).size.width / 1,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.circular(14)),
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width / 22.5,
            ),
      ),
    ),
  );
}

//IconTextButton

Widget buildIconTextButton(
    {required VoidCallback onTap,
    required String text,
    required Color iconColor,
    required IconData icon,
    required double elevation,
    required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height / 14,
    width: double.infinity,
    margin: EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width / 18,
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.circular(15)),
        backgroundColor: mutedColor,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 35,
          ),
          Icon(
            icon,
            size: MediaQuery.of(context).size.width / 11,
            color: iconColor,
          )
        ],
      ),
    ),
  );
}

// DefaultTextField

Widget buildDefaultTextField(
    {required TextInputType inputType,
    required void Function(String? value) onSaved,
    required String hintText,
    bool isObscured = false,
    required String aboveFieldText,
    required String? Function(String? value) onValidate,
    required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 18,
        ),
        child: Text(
          aboveFieldText,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width / 160,
      ),
      Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 18,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: blackColor,
                  fontWeight: FontWeight.w300,
                ),
            obscureText: isObscured,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle().copyWith(color: Colors.black26),
              border: InputBorder.none,
              suffixIcon: isObscured
                  ? Container(
                      width: MediaQuery.of(context).size.width / 20,
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 40,
                      ),
                      alignment: Alignment.centerRight,
                      child: const Icon(SolarIconsOutline.eyeClosed))
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 25,
                vertical: MediaQuery.of(context).size.width / 25,
              ),
            ),
            onSaved: (newValue) {
              // you have to check if the newValue is not null before doing any work with it
              onSaved(newValue!);
            },
            // you have to check if the newValue is not null before doing any work with it
            validator: onValidate),
      ),
    ],
  );
}
