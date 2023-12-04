import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildRowAboveCard extends StatelessWidget {
  const BuildRowAboveCard({
    super.key,
    required this.title,
    required this.numberOfBooks,
    required this.onTap,
  });

  final String title;
  final int numberOfBooks;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 8.w, top: 8.h, right: 16.w),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
          Text(
            '$numberOfBooks+',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'عرض المزيد',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFF475569)),
            ),
          ),
        ],
      ),
    );
  }
}