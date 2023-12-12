import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

// homeCubit.educationLevelsDropDownItems[1]
//           'المرحلة التعليمية',

class BuildDropDownButton extends StatelessWidget {
  final String dropDownHint;
  final String errorMessage;
  final List<String> items;
  final String? selectedValue;
  final String text;
  final IconData? icon;
  final void Function(String? value)? onSelect;
  final void Function(String? value)? onSave;
  const BuildDropDownButton({
    super.key,
    required this.dropDownHint,
    required this.items,
    required this.text,
    this.onSelect,
    this.onSave,
    required this.errorMessage,
    this.icon,
    this.selectedValue,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
        ),
        if (icon == null)
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        SizedBox(
          height: 4.h,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: DropdownButtonFormField(
            value: selectedValue,
            menuMaxHeight: 300.h,
            icon: Icon(
              SolarIconsOutline.altArrowDown,
              size: 16.h,
              color: ColorConstant.iconColor,
            ),
            decoration: InputDecoration(
              fillColor: ColorConstant.whiteColor,
              filled: true,
              // hintText: dropDownHint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black26),
              border: InputBorder.none,
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      size: 16.h,
                      color: ColorConstant.iconColor,
                    )
                  : null,
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
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return errorMessage;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
