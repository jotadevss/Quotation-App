import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/interactor/atoms/variation_atoms.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:routefly/routefly.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    super.key,
    required this.quotation,
  });

  final Quotation quotation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {
            variationState$.value.clear();
            Routefly.pop(context);
          },
          style: ButtonStyle(
            shape: const MaterialStatePropertyAll(
              CircleBorder(),
            ),
            side: MaterialStatePropertyAll(
              BorderSide(color: Colors.grey.withOpacity(0.1)),
            ),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(18)),
            overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.05)),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 16,
          ),
        ),
        const Gap(heigth: 0, width: 12),
        Text(
          quotation.currecy,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
