import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category_details/category_details_cubit.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/shared/component/vertical_divider.dart';
import 'package:kotobekia/shared/constants/images/images_constant.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildContactCard extends StatelessWidget {
  final String name;

  const BuildContactCard({
    super.key,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<CategoryDetailsCubit, CategoryDetailsStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          final categoryDetailsCubit = CategoryDetailsCubit.get(context);
          return Material(
            clipBehavior: Clip.hardEdge,
            color: ColorConstant.whiteColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorConstant.whiteColor,
              ),
              width: double.infinity,
              height: 110.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          categoryDetailsCubit.handleCall('+201223455466');
                        },
                        label: Text(
                          locale!.call,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        icon: Icon(
                          SolarIconsOutline.phoneRounded,
                          color: ColorConstant.primaryColor,
                          size: 18.w,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          locale.chat,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        icon: Icon(
                          SolarIconsOutline.letter,
                          color: ColorConstant.secondaryColor,
                          size: 18.w,
                        ),
                      ),
                    ],
                  ),
                  const BuildVerticalDivider(
                    height: double.infinity,
                  ),
                  SizedBox(
                    width: 60.w,
                    height: 60.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorConstant.whiteColor,
                          child: Image.asset(
                            ImageConstant.userDefaultImage,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const Positioned(
                          right: 0,
                          bottom: 0,
                          child: Icon(
                            SolarIconsBold.verifiedCheck,
                            color: Color(0xFF08B1E7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          locale.view_profile,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 10.sp,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
