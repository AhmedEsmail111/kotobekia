import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_book/list.dart';
import 'package:kotobekia/shared/component/home/dignity_flag.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';
import 'package:solar_icons/solar_icons.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen(
      {super.key, required this.indexCategory});
  final int indexCategory;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (context, state) {
        var cubit=context.read<HomeCubit>();
        var model=cubit.postModel;
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  CacheHelper.getData(key: AppConstant.languageKey) == 'ar'
                      ? SolarIconsOutline.altArrowRight
                      : SolarIconsOutline.altArrowLeft,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(5), child: Container()),
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
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model!.result![indexCategory].educationLevel!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                SolarIconsOutline.widget,
                              ))
                        ],
                      )),
                  BuildList(
                    model:model,
                    indexCategory: indexCategory,
                  ),
                ],
              ),
            ));
      },
      listener: (context, state) {

      },

    );
  }
}
