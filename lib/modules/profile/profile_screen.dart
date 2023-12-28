import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/profile/profile_cubit.dart';
import 'package:kotobekia/controller/profile/profile_states.dart';
import 'package:kotobekia/modules/profile/no_account_placeholder.dart';
import 'package:kotobekia/modules/profile/profile_settings%20_card.dart';
import 'package:kotobekia/modules/profile/profile_tile.dart';
import 'package:kotobekia/modules/profile/user_info_card.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if (ProfileCubit.get(context).identityUserModel == null) {
      ProfileCubit.get(context)
          .getIdentityUser(token: CacheHelper.getData(key: AppConstant.token));
    }

    ProfileCubit.get(context).getUser();
// check if the there is a token stored before making the jwt request
    ProfileCubit.get(context)
        .setUser(CacheHelper.getData(key: AppConstant.token));
    final locale = AppLocalizations.of(context)!;
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20.h, bottom: 16.h, left: 16.w, right: 16.w),
              child: Column(
                children: [
                  if (!profileCubit.hasAccount) const NoAccountPlaceholder(),
                  if (profileCubit.hasAccount)
                    Text(
                      locale.account,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  SizedBox(
                    height: 35.h,
                  ),
                  if (profileCubit.hasAccount)
                    Stack(
                      children: [
                        CircleAvatar(
                            radius: 40.w,
                            backgroundColor: const Color(0xFFD9D9D9),
                            child: profileCubit.identityUserModel != null &&
                                    profileCubit.identityUserModel!.gender ==
                                        'male'
                                ? Image.asset(
                                    ImageConstant.userMaleImage,
                                    fit: BoxFit.cover,
                                    width: 85.w,
                                    height: 85.w,
                                  )
                                : Image.asset(
                                    ImageConstant.userFemaleImage,
                                    fit: BoxFit.cover,
                                    width: 85.w,
                                    height: 85.w,
                                  )),
                        Positioned(
                          right: 0,
                          bottom: 5,
                          child: Icon(
                            SolarIconsBold.verifiedCheck,
                            size: 28.w,
                            color: const Color(0xFF08B1E7),
                          ),
                        )
                      ],
                    ),
                  SizedBox(
                    height: 8.h,
                  ),
                  if (profileCubit.hasAccount)
                    Text(
                      profileCubit.identityUserModel != null
                          ? profileCubit.identityUserModel!.fullName!
                          : 'Anonymous',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  SizedBox(
                    height: 4.h,
                  ),
                  if (profileCubit.hasAccount)
                    Text(
                      profileCubit.identityUserModel != null
                          ? profileCubit.identityUserModel!.email!
                          : 'anonymous@gmail.com',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                  SizedBox(
                    height: 16.h,
                  ),
                  if (profileCubit.hasAccount) const BuildUserInfoCard(),
                  SizedBox(
                    height: 8.h,
                  ),
                  const BuildProfileSettingsCard(),
                  SizedBox(
                    height: 12.h,
                  ),
                  if (profileCubit.hasAccount)
                    Card(
                      color: ColorConstant.whiteColor,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorConstant.whiteColor,
                            borderRadius: BorderRadius.circular(14)),
                        child: BuildProfileTile(
                          icon: SolarIconsOutline.logout_2,
                          iconColor: ColorConstant.dangerColor,
                          text: locale.log_out,
                          withSwitchIcon: false,
                          onClick: profileCubit.signOut,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
