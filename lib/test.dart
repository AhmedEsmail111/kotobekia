import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('إختر لغتك المفضلة',
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(
              height: 20,
            ),
            Text('إبتدائي', style: Theme.of(context).textTheme.
            bodyLarge),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('العربية', style: Theme.of(context)
                    .textTheme.titleMedium),
                SizedBox(
                  width: 20,
                ),
                Text('English', style: Theme.of(context).textTheme
                    .titleMedium),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'يعتقد البعض أن عدد الأحرف هو إجمالي عدد الأحرف في النص. على الرغم من ذلك، إلا أنه يمثل العدد الإجمالي لجميع الأحرف، بما في ذلك المسافات. غالبًا ما تكون عدد الأحرف مطلوبة عندما تكون هناك ضرورة إلى  ',
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 20,
            ),
            Text('إعلاناتي', style: Theme.of(context).textTheme.titleSmall!),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ض',
                    style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(fontSize: 32,color: Color(0xFF28D8AE))),
                SizedBox(
                  width: 20,
                ),
                Text('Aa',
                  style: Theme.of(context).textTheme.titleSmall!.
                  copyWith(fontSize: 32,color: Color(0xFF28D8AE)))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
            'المرحلة التعليمية',
                style: Theme.of(context).textTheme.displayLarge),
          ],
              )
        ),
     
    );
  }
}
