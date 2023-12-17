import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildLanguageTile extends StatelessWidget {
  final String text;
  final bool isClicked;
  final void Function(bool? status)? onClick;

  const BuildLanguageTile({
    super.key,
    required this.text,
    required this.isClicked,
    required this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      value: isClicked,
      activeColor: Colors.white,
      side: BorderSide.none,
      checkColor: const Color(0xFF08B1E7),
      onChanged: (status) {
        onClick!(status);
      },
    );
  }
}
