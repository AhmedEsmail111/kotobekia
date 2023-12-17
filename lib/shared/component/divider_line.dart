import 'package:flutter/material.dart';

import '../styles/colors.dart';

class BuildDividerLine extends StatelessWidget {
  final double thickness;
  const BuildDividerLine({
    super.key,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(color: ColorConstant.midGrayColor, thickness: thickness);
  }
}
