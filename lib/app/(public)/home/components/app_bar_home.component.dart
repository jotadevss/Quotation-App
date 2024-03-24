import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/interactor/models/currency.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.currency,
    required this.isLoading,
    required this.onTap,
    required this.onRefresh,
  });

  final Currency currency;
  final bool isLoading;
  final void Function() onTap;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(99),
          splashColor: kPrimaryColor.withOpacity(0.05),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currency.currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        currency.code,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: kFontDescriptionColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: kPrimaryColor.withOpacity(0.1),
                  radius: 24,
                  child: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
        OutlinedButton(
          onPressed: isLoading ? () {} : onRefresh,
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
          child: Icon(
            Icons.refresh_rounded,
            color: isLoading ? kFontDescriptionColor : kPrimaryColor,
            size: 26,
          ),
        ),
      ],
    );
  }
}
