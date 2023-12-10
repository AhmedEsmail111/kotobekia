import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category/category_cubit.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/modules/category_book/grid.dart';
import 'package:kotobekia/modules/category_book/list.dart';
import 'package:kotobekia/shared/component/back_button.dart';
import 'package:kotobekia/shared/component/home/adds_section.dart';
import 'package:kotobekia/shared/component/home/dignity_flag.dart';
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
    return BlocConsumer<CategoryCubit, CategoryStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        final categoryCubit = CategoryCubit.get(context);

        return PopScope(
          onPopInvoked: (e) {
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
                title: Container(
                  width: 292.w,
                  height: 38.h,
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(top: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.sp),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.sp),
                          borderSide: const BorderSide(
                            color: Color(0xFFC8C5C5),
                          )),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 19.h),
                      hintTextDirection: TextDirection.rtl,
                      hintStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                      hintText: locale!.search,
                      prefixIcon: Icon(
                        SolarIconsOutline.magnifier,
                        size: 15.w,
                      ),
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    BuildPalestine(text: locale.palestine_2),
                    const BuildAddsSection(
                      imageUrl:
                          "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
                    ),
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
                                categoryCubit
                                    .changeLayout(!categoryCubit.isGrid);
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
                        )),
                    BlocBuilder<HomeCubit, HomeStates>(
                      builder: (ctx, state) {
                        final homePostsModel =
                            HomeCubit.get(ctx).homePostsModel;
                        final categoryCubit = CategoryCubit.get(context);
                        return categoryCubit.isGrid
                            ? BuildGrid(
                                data:
                                    homePostsModel!.result[categoryIndex].posts,
                                categoryIndex: categoryIndex,
                              )
                            : BuildList(
                                categoryIndex: categoryIndex,
                                data:
                                    homePostsModel!.result[categoryIndex].posts,
                              );
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
