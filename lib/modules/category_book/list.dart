import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';

import 'rectangle_card_post.dart';

class BuildList extends StatelessWidget {
  const BuildList({
    super.key,
    required this.data,
    required this.categoryIndex,
  });
  final List<Post> data;
  final int categoryIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
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
                    categoryIndex: categoryIndex,
                    postIndex: index,
                  ),
                ),
              ),
              title: data[index].title,
              image: data[index].images[0],
              price: data[index].price,
              description: data[index].description,
              educationLevel: data[index].educationLevel,
              location: data[index].city,
              numberOfBooks: data[index].numberOfBooks,
              numberOfWatcher: data[index].views,
              timeSince: data[index].createdAt,
            ),
          );
        },
      ),
    );
  }
}
