import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/controller/home/home_cubit.dart';
import 'package:kotobekia/controller/home/home_state.dart';
import 'package:kotobekia/modules/category_book/grid.dart';
import 'package:kotobekia/shared/component/row_like_appbar.dart';

class FavoriteAddsScreen extends StatelessWidget {
  const FavoriteAddsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 24.h),
                  height: 110.h,
                  color: const Color(0xFFF3F2F7),
                  child: BuildRowLikeAppBar(
                    color: const Color(0xFFD9D9D9),
                    text: locale!.favorite_adds,
                  )),
              BuildGrid(data: [], categoryIndex: 0)
            ],
          ),
        );
      },
    );
  }
}
