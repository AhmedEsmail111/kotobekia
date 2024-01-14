import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kotobekia/controller/favorites/favorites_cubit.dart';
import 'package:kotobekia/controller/favorites/favorites_states.dart';
import 'package:kotobekia/shared/component/loading_indicator.dart';
import 'package:kotobekia/shared/component/posts_grid.dart';
import 'package:kotobekia/shared/component/row_like_appbar.dart';
import 'package:kotobekia/shared/component/toast_message.dart';

class FavoriteAddsScreen extends StatelessWidget {
  const FavoriteAddsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    // if (FavoritesCubit.get(context).favePostsModel == null) {
    FavoritesCubit.get(context).getFavPosts();
    // }

    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (ctx, state) {
        if (state is GetFavPostsInternetFailureState) {
          buildToastMessage(
              message: locale.no_internet, gravity: ToastGravity.CENTER);
        }
      },
      builder: (ctx, state) {
        final favCubit = FavoritesCubit.get(ctx);
        return Scaffold(
          body: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 24.h),
                  height: 110.h,
                  color: const Color(0xFFF3F2F7),
                  child: BuildRowLikeAppBar(
                    color: const Color(0xFFD9D9D9),
                    text: locale!.favorite_adds,
                  )),
              state is GetFavPostsLoadingState &&
                      favCubit.favePostsModel == null
                  ? const BuildLoadingIndicator()
                  : BuildPostsGrid(
                      data: favCubit.favePostsModel != null
                          ? favCubit.favePostsModel!.posts
                          : [],
                    )
            ],
          ),
        );
      },
    );
  }
}
