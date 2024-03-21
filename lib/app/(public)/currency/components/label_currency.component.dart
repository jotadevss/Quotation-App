import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quotation_currency_app/app/(public)/components/gap.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';

class LabelCurrency extends StatelessWidget {
  const LabelCurrency({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  final String iconPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(iconPath),
        const Gap(heigth: 12, width: 0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(heigth: 8, width: 0),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kFontDescriptionColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
