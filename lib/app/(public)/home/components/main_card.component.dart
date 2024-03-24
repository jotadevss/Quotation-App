import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/utils/formatter/currency_formatter.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.onTap,
    required this.currency,
    required this.code,
    required this.value,
    required this.selectedCurrencyCode,
    required this.pctChange,
  });

  final void Function() onTap;
  final String currency;
  final String code;
  final double value;
  final String selectedCurrencyCode;
  final double pctChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              code,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(heigth: 32, width: 0),
            Text(
              CurrencyFormatter.format(value, selectedCurrencyCode),
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(heigth: 8, width: 0),
            Row(
              children: [
                const Text(
                  "Variação:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_up_rounded,
                  color: Colors.green,
                ),
                Text(
                  "$pctChange%",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
