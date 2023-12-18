import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category/category_cubit.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/models/category_model/specific_category_model.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';
import 'package:kotobekia/shared/component/home/card_to_posts.dart';
import 'package:kotobekia/shared/styles/colors.dart';

class BuildGrid extends StatelessWidget {
  const BuildGrid({
    super.key,
    required this.data,
    required this.categoryIndex,
  });
  final List<Result> data;
  final int categoryIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoryCubit, CategoryStates>(
        builder: ((context, state) {
          final categoryCubit = CategoryCubit.get(context);
          return GridView.builder(
            controller: categoryCubit.scrollController,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: categoryCubit.isLoading ? 1 : 2,
              childAspectRatio: 0.5.h
            ),
            physics: const BouncingScrollPhysics(),
            // isLoading will only be true when he tries to fetch other pages(more date)
            itemCount: data.length + (categoryCubit.isLoading ? 1 : 0),
            itemBuilder: (ctx, index) {
              if (index == categoryCubit.posts.length) {
                Timer(const Duration(milliseconds: 30), () {
                  categoryCubit.scrollController.jumpTo(
                      categoryCubit.scrollController.position.maxScrollExtent);
                });
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor,
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 4.h,
                ),
                child: BuildPosts(
                  onTap: () => Navigator.push(
                    ctx,
                    MaterialPageRoute(
                      builder: (ctx) => CategoryDetailsScreen(
                        id: data[index].id,
                        title: data[index].title,
                        description: data[index].description,
                        images: data[index].images,
                        price: data[index].price,
                        grade: data[index].grade,
                        bookEdition: data[index].bookEdition,
                        educationLevel: data[index].educationLevel,
                        views: data[index].views,
                        numberOfBooks: data[index].numberOfBooks,
                        semester: data[index].semester,
                        educationType: data[index].educationType,
                        location: data[index].location,
                        city: data[index].city,
                        createdAt: data[index].createdAt,
                        postId: data[index].postId,
                      ),
                    ),
                  ),
                  title: data[index].title,
                  image: data[index].images[0],
                  price: data[index].price,
                  description: data[index].description,
                  educationLevel: data[index].educationLevel,
                  cityLocation: data[index].city,
                  numberOfBooks: data[index].numberOfBooks,
                  numberOfWatcher: data[index].views,
                  timeSince: data[index].createdAt,
                  imageWidth: 150.w,
                  imageHeight: 135.h,
                  borderRadius: BorderRadius.circular(14),
                  cardElevation: 2,
                  height: 275.h,
                  width: MediaQuery.of(context).size.width / 2.2,
                  contentPadding: EdgeInsets.all(8.w),
                  cardBorder: Border.all(color: const Color(0xFFEDEDED)),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
