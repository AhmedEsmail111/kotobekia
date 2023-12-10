import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';
import 'package:kotobekia/shared/component/home/card_to_posts.dart';

class BuildGrid extends StatelessWidget {
  const BuildGrid({
    super.key,
    required this.data,
    required this.categoryIndex,
  });
  final List<Post> data;
  final int categoryIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 275.h,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (ctx, index) {
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
                    categoryIndex: categoryIndex,
                    postIndex: index,
                  ),
                ),
              ),
              title: data[index].title,
              image: data[index].images[0],
              price: data[index].price,
              description: data[index].description,
              educationLevel: reversedLevels[data[index].educationLevel]!,
              location: data[index].city,
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
      ),
    );
  }
}
