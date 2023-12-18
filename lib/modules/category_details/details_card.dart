import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kotobekia/shared/component/home/price_container.dart';
import 'package:kotobekia/shared/helper/functions.dart';
import 'package:kotobekia/shared/styles/colors.dart';
import 'package:solar_icons/solar_icons.dart';

class BuildCardDetails extends StatelessWidget {
  final String title;
  final int price;
  final String description;

  final String cityLocation;
  final DateTime timeSince;

  const BuildCardDetails({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.cityLocation,
    required this.timeSince,
  });
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final time = DateTime.now().difference(timeSince).inDays;

    final timeText = time <= 10 ? locale!.days : locale!.one_day_calender;

    //  to show returned city based on the user's locale
    final reversedRegions = {
      'cairo': locale.cairo,
      'giza': locale.giza,
      'alexandria': locale.alexandria,
      'dakahlia': locale.dakahlia,
      'sharqia': locale.sharqia,
      'monufia': locale.monufia,
      'qalyubia': locale.qalyubia,
      'beheira': locale.beheira,
      'port_said': locale.port_said,
      'damietta': locale.damietta,
      'ismailia': locale.ismailia,
      'suez': locale.suez,
      'kafr_el_sheikh': locale.kafr_el_sheikh,
      'fayoum': locale.fayoum,
      'beni_suef': locale.beni_suef,
      'matruh': locale.matruh,
      'north_sinai': locale.north_sinai,
      'south_sinai': locale.south_sinai,
      'minya': locale.minya,
      'asyut': locale.asyut,
      'sohag': locale.sohag,
      'qena': locale.qena,
      'red_sea': locale.red_sea,
      'luxor': locale.luxor,
      'aswan': locale.aswan,
    };
    final city = reversedRegions[cityLocation];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ColorConstant.whiteColor,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: HelperFunctions.isArabic(title)
                ? Alignment.topRight
                : Alignment.topLeft,
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
              textDirection: HelperFunctions.isArabic(title)
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            textAlign: TextAlign.start,
            textDirection: HelperFunctions.isArabic(description)
                ? TextDirection.rtl
                : TextDirection.ltr,
            softWrap: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              const Icon(
                SolarIconsOutline.verifiedCheck,
                color: ColorConstant.primaryColor,
              ),
              SizedBox(
                width: 4.w,
              ),
              BuildPriceContainer(price: price, locale: locale),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Divider(
            height: 1.h,
            thickness: 1.5,
          ),
          Row(
            children: [
              Icon(
                SolarIconsOutline.mapPoint,
                color: const Color(0xFF747474),
                size: 14.h,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                city!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14.sp),
                textDirection: HelperFunctions.isArabic(city)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
              const Spacer(),
              Icon(
                SolarIconsOutline.clockCircle,
                color: const Color(0xFF747474),
                size: 14.h,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                locale.time_since('$time $timeText'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 10.sp,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
