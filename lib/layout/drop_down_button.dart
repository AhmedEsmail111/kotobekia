import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

// homeCubit.educationLevelsDropDownItems[1]
//           'المرحلة التعليمية',

class BuildDropDownButton extends StatelessWidget {
  final String dropDownValue;
  final List<String> items;
  final String text;
  final void Function(String? value)? onSelect;
  final void Function(String? value)? onSave;
  const BuildDropDownButton({
    super.key,
    required this.dropDownValue,
    required this.items,
    required this.text,
    this.onSelect,
    this.onSave,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: DropdownButtonFormField(
            value: dropDownValue,
            menuMaxHeight: 300.h,
            icon: Icon(
              SolarIconsOutline.altArrowDown,
              size: 16.h,
              color: iconColor,
            ),
            decoration: const InputDecoration(
              fillColor: whiteColor,
              filled: true,
              border: InputBorder.none,
            ),
            items: items.map((level) {
              return DropdownMenuItem(
                value: level,
                child: Container(
                  height: 50,
                  alignment: Alignment.topCenter,
                  child: RichText(
                    text: TextSpan(
                      text: level,
                      style: DefaultTextStyle.of(context).style,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onSelect,
            onSaved: onSave,
          ),
        ),
      ],
    );
  }
}
