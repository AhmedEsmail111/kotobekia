import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class BuildProfileTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final bool switchIcon;
  final void Function()? onClick;

  const BuildProfileTile({
    super.key,
    required this.icon,
    required this.text,
    required this.switchIcon,
    required this.onClick,
    required this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 8.w,
      onTap: onClick,
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              color: iconColor == ColorConstant.dangerColor
                  ? ColorConstant.dangerColor
                  : Colors.black,
            ),
      ),
      trailing: switchIcon
          ? Switch(
              value: false,
              onChanged: (status) {},
            )
          : null,
    );
  }
}
