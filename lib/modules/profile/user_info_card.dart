import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/profile/profile_cubit.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';
import 'package:kotobekia/shared/component/vertical_divider.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildUserInfoCard extends StatelessWidget {
  const BuildUserInfoCard({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final profileCubit = ProfileCubit.get(context);
        return Card(
          color: ColorConstant.whiteColor,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorConstant.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      locale!.number_of_chats,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    Text(
                      '12 ${locale.interaction}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF747474),
                          ),
                    ),
                  ],
                ),
                BuildVerticalDivider(
                  height: 45.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      locale.number_of_posts,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    Text(
                      profileCubit.userDataModel != null
                          ? '${profileCubit.userDataModel!.user.yourAds.length} ${locale.adds}'
                          : ' 0 ${locale.adds}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF747474),
                          ),
                    ),
                  ],
                ),
                BuildVerticalDivider(
                  height: 45.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      locale.personal_badges,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    Wrap(
                      children: [
                        Icon(
                          SolarIconsOutline.medalRibbonStar,
                          size: 18.w,
                        ),
                        Icon(
                          SolarIconsOutline.medalRibbonStar,
                          size: 18.w,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
