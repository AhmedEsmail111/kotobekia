import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import '../styles/colors.dart';

// card that contain about post books

class BuildPosts extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String destination;
  final String price;
  final String image;
  final String educationLevel;
  final String location;
  final int lastTime;
  final int numberOfWatcher;
  final int numberOfBooks;

  const BuildPosts(
      {super.key,
      required this.context,
      required this.title,
      required this.destination,
      required this.price,
      required this.image,
      required this.educationLevel,
      required this.location,
      required this.lastTime,
      required this.numberOfWatcher,
      required this.numberOfBooks});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width / 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(MediaQuery.sizeOf(context).width / 25)),
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 50),
        width: MediaQuery.sizeOf(context).width / 2.37,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width / 25),
                child: Image.network(
                  width: MediaQuery.sizeOf(context).width / 2.8,
                  height: MediaQuery.sizeOf(context).height / 6.05,
                  fit: BoxFit.cover,
                  image,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).width / 29),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    destination,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).width / 30,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width / 55,
                  ),
                  Row(
                    children: [
                      Icon(
                        SolarIconsOutline.book,
                        size: MediaQuery.sizeOf(context).width / 25,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 55,
                      ),
                      Text(
                        '$numberOfBooks',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.sizeOf(context).width / 30,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 55,
                      ),
                      Icon(
                        SolarIconsOutline.eye,
                        size: MediaQuery.sizeOf(context).width / 25,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 55,
                      ),
                      Text(
                        '$numberOfWatcher',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.sizeOf(context).width / 30,
                            fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width / 10,
                        height: MediaQuery.sizeOf(context).height / 39,
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width / 30)),
                        child: Text(
                          price,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: MediaQuery.sizeOf(context).width / 38,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width / 85,
                  ),
                  Text(
                    educationLevel,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).width / 30,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        SolarIconsOutline.mapPoint,
                        size: MediaQuery.sizeOf(context).width / 30,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 90,
                      ),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.sizeOf(context).width / 30,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 55,
                      ),
                      Spacer(),
                      Icon(
                        SolarIconsOutline.clockCircle,
                        size: MediaQuery.sizeOf(context).width / 36,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 120,
                      ),
                      Text(
                        'منذ 5 ايام',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.sizeOf(context).width / 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

