import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class LayoutScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  LayoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final h = MediaQuery.of(context).size.height;

    final locale = AppLocalizations.of(context);

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);

        return Scaffold(
          key: scaffoldKey,
          body: homeCubit.screens[homeCubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
            child: BottomNavigationBar(
              elevation: 4,
              backgroundColor: ColorConstant.whiteColor,
              currentIndex: homeCubit.currentIndex,
              onTap: (index) {
                homeCubit.changeBottomNavBarIndex(index);
              },
              selectedLabelStyle:
                  Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: w / 30,
                      ),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: w / 30,
                      ),
              selectedItemColor: ColorConstant.primaryColor,
              selectedIconTheme: Theme.of(context).iconTheme.copyWith(
                    color: ColorConstant.primaryColor,
                  ),
              unselectedIconTheme: Theme.of(context).iconTheme,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: locale!.home,
                  icon: const Icon(
                    SolarIconsOutline.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: locale.my_posts,
                  icon: const Icon(
                    SolarIconsOutline.widget_4,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    SolarIconsOutline.addSquare,
                    size: 40.h,
                    color: ColorConstant.primaryColor,
                  ),
                ),
                BottomNavigationBarItem(
                  label: locale.messages,
                  icon: const Icon(SolarIconsOutline.letter),
                ),
                BottomNavigationBarItem(
                  label: locale.account,
                  icon: const Icon(
                    SolarIconsOutline.user,
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: Container(
          //     margin: EdgeInsets.symmetric(
          //         horizontal: MediaQuery.of(context).size.width / 2.4,
          //         vertical: 0),
          //     child: IconButton(
          //       icon: Icon(SolarIconsOutline.addSquare),
          //       onPressed: () {},
          //     )),
        );
      },
    );
  }
}
