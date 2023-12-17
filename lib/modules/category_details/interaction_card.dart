import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category_details/category_details_cubit.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildInteractionCard extends StatelessWidget {
  final String postIdUrl;
  const BuildInteractionCard({
    super.key,
    required this.postIdUrl,
  });
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        return Container(
          height: 100.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: ColorConstant.foregroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Ad id #1256',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF939393),
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      locale!.save,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    icon: Icon(
                      SolarIconsOutline.heart,
                      size: 20.h,
                      color: ColorConstant.iconColor,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      locale.report,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    icon: Icon(
                      SolarIconsBold.shieldUser,
                      size: 20.h,
                      color: ColorConstant.iconColor,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      CategoryDetailsCubit.get(ctx).sharePost(postIdUrl);
                    },
                    label: Text(
                      locale.share,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    icon: Icon(
                      SolarIconsBold.forward,
                      size: 20.h,
                      color: ColorConstant.iconColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
