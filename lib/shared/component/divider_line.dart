import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class BuildDividerLine extends StatelessWidget {
  const BuildDividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
        color: midGrayColor, thickness: 1);
  }
}
