import 'package:flutter/material.dart';
import 'package:kotobekia/shared/component/back_button.dart';

class BuildRowLikeAppBar extends StatelessWidget {
  final Color color;
  final String text;

  const BuildRowLikeAppBar({
    super.key,
    required this.color,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildBackButton(
          hasBackground: true,
          darkBackground: color,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.4,
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
