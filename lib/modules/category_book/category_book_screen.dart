import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category/category_cubit.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_book/grid.dart';
import 'package:kotobekia/modules/category_book/list.dart';
import 'package:kotobekia/shared/component/back_button.dart';
import 'package:kotobekia/shared/component/home/dignity_flag.dart';
import 'package:kotobekia/shared/component/home/search_container.dart';
import 'package:kotobekia/shared/component/home/text_placeholder.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen({
    super.key,
    required this.category,
    required this.categoryIndex,
  });

  final int categoryIndex;
  final String category;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    CategoryCubit.get(context).handleScroll(
      category: levels[categoryIndex],
      context: context,
      noInternet: locale!.no_internet,
      weakInternet: locale.weak_internet,
      noMore: locale.no_more_message,
    );
    CategoryCubit.get(context).getCategory(
      category: levels[categoryIndex],
      context: context,
      noInternet: locale.no_internet,
      weakInternet: locale.weak_internet,
      noMore: locale.no_more_message,
    );

    return BlocConsumer<CategoryCubit, CategoryStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        final categoryCubit = CategoryCubit.get(context);
        print(categoryCubit.posts.length);
        print(categoryCubit.page);
        print(
          categoryCubit.isThereOtherData,
        );

        return PopScope(
          onPopInvoked: (e) {
            categoryCubit.posts = [];
            categoryCubit.isThereOtherData = true;
            categoryCubit.page = 1;
            categoryCubit.changeLayout(true);
          },
          canPop: true,
          child: Scaffold(
            appBar: AppBar(
              leading: const BuildBackButton(
                hasBackground: false,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(5),
                child: Container(),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    SolarIconsOutline.tuning_2,
                    size: 19.w,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    SolarIconsOutline.bell,
                    size: 19.w,
                  ),
                ),
              ],
              title: const BuildSearchContainer(),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  BuildPalestine(text: locale.palestine_2),
                  // const BuildAddsSection(
                  //   imageUrl:
                  //       "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        IconButton(
                          onPressed: () {
                            categoryCubit.changeLayout(!categoryCubit.isGrid);
                          },
                          icon: !categoryCubit.isGrid
                              ? Icon(
                                  SolarIconsOutline.widget,
                                  size: 32.w,
                                )
                              : Icon(
                                  SolarIconsOutline.hamburgerMenu,
                                  size: 32.w,
                                ),
                        ),
                      ],
                    ),
                  ),
                  if (state is GetCategoryDataLoadingState &&
                      state.isFirstFetch)
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor,
                        ),
                      ),
                    ),
                  if (state is GetCategoryDataInternetFailureState &&
                      categoryCubit.posts.isEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: BuildTextPlaceHolder(text: state.message),
                    ),
                  categoryCubit.isGrid
                      ? BuildGrid(
                          data: categoryCubit.posts,
                          categoryIndex: categoryIndex,
                        )
                      : BuildList(
                          categoryIndex: categoryIndex,
                          data: categoryCubit.posts,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
