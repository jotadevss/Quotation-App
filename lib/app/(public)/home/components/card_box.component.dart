import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/interactor/models/currency.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:quotation_currency_app/app/utils/formatter/currency_formatter.dart';

class CardBox extends StatelessWidget {
  const CardBox({
    super.key,
    required this.quotation,
    required this.currency,
    required this.onTap,
  });

  final Quotation quotation;
  final Currency currency;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kFontDescriptionColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quotation.currecy,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    quotation.code,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CurrencyFormatter.format(quotation.value, currency.code),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_up_rounded,
                            color: (quotation.pctChange < 0) ? Colors.red : Colors.green,
                          ),
                          Text(
                            "${quotation.pctChange}%",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: (quotation.pctChange < 0) ? Colors.red : Colors.green,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
