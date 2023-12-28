import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/category/category_cubit.dart';
import 'package:kotobekia/controller/category/category_states.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';
import 'package:kotobekia/shared/styles/colors.dart';

import 'rectangle_card_post.dart';

class BuildList extends StatelessWidget {
  const BuildList({
    super.key,
    required this.data,
  });
  final List<Post> data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(builder: (ctx, state) {
      final categoryCubit = CategoryCubit.get(ctx);
      return Expanded(
        child: ListView.builder(
          controller: categoryCubit.scrollController,
          physics: const BouncingScrollPhysics(),
          // isLoading will only be true when he tries to fetch other pages(more date)
          itemCount: data.length + (categoryCubit.isLoading ? 1 : 0),
          itemBuilder: (context, index) {
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
                horizontal: 16.w,
                vertical: 5.h,
              ),
              child: BuildRectangleCardPost(
                onTap: () => Navigator.push(
                  context,
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
                      user: data[index].createdBy,
                    ),
                  ),
                ),
                id: data[index].id,
                title: data[index].title,
                image: data[index].images[0],
                price: data[index].price,
                description: data[index].description,
                educationLevel: data[index].educationLevel,
                cityLocation: data[index].city,
                numberOfBooks: data[index].numberOfBooks,
                numberOfWatcher: data[index].views,
                timeSince: data[index].createdAt,
              ),
            );
          },
        ),
      );
    });
  }
}
