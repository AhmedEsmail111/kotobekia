import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category_details/category_details_cubit.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/shared/component/fave_icon.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildInteractionCard extends StatelessWidget {
  final String postId;
  final String userId;
  final String feedback;
  const BuildInteractionCard({
    super.key,
    required this.postId,
    required this.userId,
    required this.feedback,
  });
  @override
  Widget build(BuildContext context) {
    bool? isFavorite;
    final locale = AppLocalizations.of(context)!;
    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsStates>(
      listener: (ctx, state) {},
      builder: (context, state) {
        final categoryDetailsCubit = CategoryDetailsCubit.get(context);
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
                  BuildFaveIcon(id: postId),
                  TextButton.icon(
                    onPressed: state is ReportPostLoadingState ||
                            !HelperFunctions.hasUserRegistered()
                        ? null
                        : () {
                            categoryDetailsCubit.reportPost(
                                postId, userId, feedback);
                          },
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
                      categoryDetailsCubit.sharePost(postId);
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
