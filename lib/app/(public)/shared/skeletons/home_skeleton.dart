import 'package:flutter/widgets.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';

class SkeletonHome extends StatelessWidget {
  const SkeletonHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(heigth: 26, width: 0),
        Row(
          children: [
            Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                color: kFontDescriptionColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ],
        ),
        const Gap(heigth: 24, width: 0),
        Container(
          height: 175,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: kFontDescriptionColor.withOpacity(0.05),
          ),
        ),
        const Gap(heigth: 34, width: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                color: kFontDescriptionColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                color: kFontDescriptionColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ],
        ),
        const Gap(heigth: 8, width: 0),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 2,
            itemBuilder: (_, __) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kFontDescriptionColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(32),
                ),
              );
            },
          ),
        ),
        Container(
          height: 95,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kFontDescriptionColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ],
    );
  }
}
