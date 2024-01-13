import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/search/search_cubit.dart';
import 'package:kotobekia/controller/search/search_states.dart';
import 'package:kotobekia/modules/category_book/rectangle_card_post.dart';
import 'package:kotobekia/shared/component/authentication/default_text_form_in_app.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final searchCubit = SearchCubit.get(context);
        return PopScope(
          onPopInvoked: (_) {
            if (searchCubit.searchModel != null) {
              searchCubit.searchModel = null;
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
                child: Column(
                  children: [
                    BuildDefaultTextField(
                      prefixIcons: const Icon(SolarIconsOutline.library),
                      inputType: TextInputType.text,
                      withText: false,
                      hintText: locale.search_by_title,
                      backGroundColor: ColorConstant.whiteColor,
                      context: context,
                      width: double.infinity,
                      height: 60.h,
                      maxLenght: 100,
                      isObscured: false,
                      onChange: (value) {
                        searchCubit.search(value);
                      },
                    ),
                    if (state is LoadingSearchState)
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(
                          child: CircularProgressIndicator(
                              color: ColorConstant.primaryColor),
                        ),
                      ),
                    if (searchCubit.searchModel != null &&
                        state is! LoadingSearchState)
                      Expanded(
                        child: ListView.builder(
                          itemCount: searchCubit.searchModel!.posts.length,
                          itemBuilder: (ctx, index) {
                            return BuildRectangleCardPost(
                              title:
                                  searchCubit.searchModel!.posts[index].title,
                              description: searchCubit
                                  .searchModel!.posts[index].description,
                              price:
                                  searchCubit.searchModel!.posts[index].price,
                              image: searchCubit
                                  .searchModel!.posts[index].images[0],
                              educationLevel: searchCubit
                                  .searchModel!.posts[index].educationLevel,
                              cityLocation: searchCubit
                                  .searchModel!.posts[index].location,
                              numberOfWatcher:
                                  searchCubit.searchModel!.posts[index].views,
                              numberOfBooks: searchCubit
                                  .searchModel!.posts[index].numberOfBooks,
                              onTap: () {},
                              timeSince: searchCubit
                                  .searchModel!.posts[index].createdAt,
                              id: searchCubit.searchModel!.posts[index].id,
                            );
                          },
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
