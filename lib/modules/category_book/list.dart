import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/models/post_model/post_model.dart';
import 'package:kotobekia/modules/category_details/category_details_screen.dart';

import 'rectangle_card_post.dart';

class BuildList extends StatelessWidget {
  const BuildList({super.key, required this.data});
  final List<Post> data;
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
              vertical: 8.h,
            ),
            child: BuildRectangleCardPost(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => CategoryDetailsScreen(
                    postDetails: Post(
                      title: data[index].title,
                      images: data[index].images,
                      price: data[index].price,
                      grade: data[index].grade,
                      educationLevel: data[index].educationLevel,
                      location: data[index].location,
                      numberOfBooks: data[index].numberOfBooks,
                      seen: data[index].seen,
                      description: data[index].description,
                      createdSince: 'منذ 5 أيام',
                      educationType: data[index].educationType,
                      bookEdition: data[index].bookEdition,
                      semester: data[index].semester,
                    ),
                  ),
                ),
              ),
              title: data[index].title,
              image: data[index].images[0],
              price: data[index].price,
              description: data[index].description,
              educationLevel: data[index].educationLevel,
              location: data[index].location,
              numberOfBooks: data[index].numberOfBooks,
              numberOfWatcher: data[index].seen,
            ),
            // BuildPosts(
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (ctx) => const CategoryDetailsScreen()),
            //   ),
            //   title: data[index]['title'],
            //   description: data[index]['description'],
            //   price: data[index]['price'],
            //   image: data[index]['image'],
            //   educationLevel: data[index]['educationLevel'],
            //   location: data[index]['location'],
            //   numberOfWatcher: data[index]['seen'],
            //   numberOfBooks: data[index]['number_of_books'],
            //   cardBorder: Border.all(color: const Color(0xFFEDEDED)),
            //   borderRadius: BorderRadius.circular(14),
            //   imageHeight: 150.h,
            //   contentPadding: EdgeInsets.all(6.w),
            //   imageWidth: double.infinity,
            //   cardElevation: 3,
            // ),
          );
        },
      ),
    );
  }
}