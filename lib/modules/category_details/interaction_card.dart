import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category_details/category_details_cubit.dart';
import 'package:kotobekia/controller/category_details/category_details_states.dart';
import 'package:kotobekia/controller/favorites/favorites_cubit.dart';
import 'package:kotobekia/controller/favorites/favorites_states.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildInteractionCard extends StatelessWidget {
  final String postId;
  const BuildInteractionCard({
    super.key,
    required this.postId,
  });
  @override
  Widget build(BuildContext context) {
    bool? isFavorite;
    final locale = AppLocalizations.of(context)!;
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
                  BlocBuilder<FavoritesCubit, FavoritesStates>(
                    builder: (context, state) {
                      final favCubit = FavoritesCubit.get(context);
                      final favePostsModel = favCubit.favPostsModel;
                      if (favePostsModel != null) {
                        isFavorite =
                            HelperFunctions.isFav(favePostsModel.posts, postId);
                      }
                      return TextButton.icon(
                        label: Text(
                          locale.save,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        icon: Icon(
                          isFavorite != null && isFavorite!
                              ? SolarIconsBold.heart
                              : SolarIconsOutline.heart,
                          color: isFavorite != null && isFavorite!
                              ? ColorConstant.dangerColor
                              : const Color(0xFFD7D7D8),
                          size: 26.w,
                        ),
                        onPressed: state is AddToFavLoadingState ||
                                state is RemoveFromFavLoadingState
                            ? null
                            : () {
                                if (HelperFunctions.hasUserRegistered()) {
                                  FavoritesCubit.get(context).handleLoveClick(
                                    status: isFavorite ?? false,
                                    postId: postId,
                                  );
                                } else {
                                  Navigator.pushNamed(context, 'getStart');
                                }
                              },
                      );
                    },
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
                      CategoryDetailsCubit.get(ctx).sharePost(postId);
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
