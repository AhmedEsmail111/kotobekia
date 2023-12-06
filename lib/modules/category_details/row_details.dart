import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildRowDetails extends StatelessWidget {
  final bool? isFirst;
  final bool? isLast;
  final String firstText;
  final String secondText;

  const BuildRowDetails({
    super.key,
    this.isFirst,
    required this.firstText,
    required this.secondText,
    this.isLast,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFirst != null)
            Text(
              AppLocalizations.of(context)!.book_details,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          Row(
            children: [
              Text(
                firstText,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: const Color(0xFF939393),
                    fontSize: 14.sp),
              ),
              const Spacer(),
              Text(
                secondText,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          if (isLast != null)
            const Divider(
              thickness: 1.5,
            )


        ],
      ),
    );
  }
}
