import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';
import 'package:kotobekia/shared/component/home/add_section.dart';

import 'rectangle_card_post.dart';

class BuildList extends StatelessWidget {
  const BuildList({super.key,
    required this.indexCategory,
    required this.model});

  final int indexCategory;
  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: model.result![indexCategory].posts!.length,
        itemBuilder: (context, index) {
          return index == 0
              ? const BuildAddsSection(
                  imageUrl:
                      "https://www.cairo24.com/UploadCache/libfiles/109/8/600x338o/558.jpg",
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 5.h,
                  ),
                  child: BuildRectangleCardPost(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => CategoryDetailsScreen(
                          indexCategory: index,
                          index: 0,
                        ),
                      ),
                    ),
                    title: model.result![indexCategory].posts![index].title!,
                    image:  model.result![indexCategory].posts![index].images![0],
                    price:  double.parse(model.result![indexCategory].posts![index].price!),
                    description:  model.result![indexCategory].posts![index].description!,
                    educationLevel:  model.result![indexCategory].educationLevel!,
                    location:   model.result![indexCategory].posts![index].location!,
                    numberOfBooks:  model.result![indexCategory].posts![index].numberOfBooks!,
                    numberOfWatcher:  model.result![indexCategory].posts![index].views!,
                  ),
                );
        },
      ),
    );
  }
}
