import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/favorites/favorites_cubit.dart';
import 'package:kotobekia/controller/favorites/favorites_states.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildFaveIcon extends StatelessWidget {
  final String id;
  final bool hasBackBackground;
  const BuildFaveIcon(
      {super.key, required this.id, this.hasBackBackground = false});
  @override
  Widget build(BuildContext context) {
    bool? isFavorite;
    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final faveCubit = FavoritesCubit.get(context);
        final favePostsModel = faveCubit.favePostsModel;
        if (favePostsModel != null) {
          isFavorite = HelperFunctions.isFav(faveCubit.faveIds, id);
        }
        return Container(
          margin: hasBackBackground ? EdgeInsets.all(6.w) : EdgeInsets.zero,
          child: IconButton(
            style: IconButton.styleFrom(
                backgroundColor: hasBackBackground
                    ? const Color(0xFFD7D7D8).withOpacity(0.4)
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14))),
            icon: Icon(
              isFavorite != null && isFavorite!
                  ? SolarIconsBold.heart
                  : SolarIconsOutline.heart,
              color: isFavorite != null && isFavorite!
                  ? ColorConstant.dangerColor
                  : const Color(0xFFD7D7D8),
              size: 26.w,
            ),
            onPressed: () {
              if (HelperFunctions.hasUserRegistered()) {
                FavoritesCubit.get(context).handleLoveClick(
                  status: isFavorite ?? false,
                  postId: id,
                );
                faveCubit.toggleFaveStatus(id, isFavorite ?? false);
              } else {
                Navigator.pushNamed(context, 'getStart');
              }
            },
          ),
        );
      },
    );
  }
}
