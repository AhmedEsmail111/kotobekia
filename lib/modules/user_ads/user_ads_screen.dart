import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/user_ads/user_ads_cubit.dart';
import 'package:kotobekia/controller/user_ads/user_ads_states.dart';
import 'package:kotobekia/shared/component/loading_indicator.dart';
import 'package:kotobekia/shared/component/posts_grid.dart';
import 'package:kotobekia/shared/helper/functions.dart';

class UserAdsScreen extends StatelessWidget {
  const UserAdsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if (UserAddsCubit.get(context).userAdsModel == null ||
        UserAddsCubit.get(context).userAdsModel!.posts.isEmpty) {
      UserAddsCubit.get(context).getUserPost();
    }
    final locale = AppLocalizations.of(context)!;
    return BlocConsumer<UserAddsCubit, UserAddsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final userAdsCubit = UserAddsCubit.get(context);
        final userAdsModel = userAdsCubit.userAdsModel;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 25.h),
                  child: Text(
                    locale.my_posts,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                if (state is GetUserAddsLoadingState)
                  const BuildLoadingIndicator(),
                if (HelperFunctions.hasUserRegistered())
                  BuildPostsGrid(
                    data: userAdsModel != null ? userAdsModel.posts : [],
                  ),
                if (!HelperFunctions.hasUserRegistered())
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Center(
                      child: Text(locale.have_no_profile_message),
                    ),
                  ),
                if (userAdsModel != null && userAdsModel.posts.isEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Center(
                      child: Text(
                        locale.have_no_post_message,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
