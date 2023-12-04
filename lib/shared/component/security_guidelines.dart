import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kotobekia/shared/component/row_in_securiy_rules.dart';
import 'package:solar_icons/solar_icons.dart';

import '../styles/colors.dart';

class BuildSecurityGuideLines extends StatelessWidget {
  final double w;
  final double h;
  final TextTheme font;

  const BuildSecurityGuideLines(
      {super.key, required this.h, required this.w, required this.font});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: h / 60),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.midGrayColor,
        borderRadius: BorderRadius.circular(w / 30),
      ),
      child: Padding(
        padding: EdgeInsets.all(w / 80),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  SolarIconsOutline.shieldCheck,
                  color: ColorConstant.primaryColor,
                  size: h / 40,
                ),
                SizedBox(
                  width: w / 65,
                ),
                Text(
                  'سلامتك تهمنا',
                  style: font.titleMedium,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: w / 30, top: w / 80),
              child: const Column(
                children: [
                  buildRowTextSecurity(
                      withIcon: false,
                      text:
                          'لو واجهت أي إسائه ما تترددش في انك تبلغ عن اللي بيكلمك . '),
                  buildRowTextSecurity(
                      withIcon: true,
                      text: 'تقدر تبلغ عن اي اسائة من خلال الايقون دي '),
                  buildRowTextSecurity(
                      withIcon: false,
                      text:
                          ' هتلاقيها في اكترمن مكان في التطبيق حسب انت عايز تبلغ عن ايه '),
                  buildRowTextSecurity(
                      withIcon: false,
                      text:
                          'وانت بتستلم الكتاب حاول تكون في مكان عام ويفضل ما تروحش لوحدك'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
