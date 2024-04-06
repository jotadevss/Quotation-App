import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:quotation_currency_app/app/utils/formatter/currency_formatter.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({
    super.key,
    required this.quotation,
    required this.selectedCurrencyCode,
  });

  final Quotation quotation;
  final String selectedCurrencyCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          const Text(
            "Valor Atual",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kFontDescriptionColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              CurrencyFormatter.format(quotation.value, selectedCurrencyCode),
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (quotation.pctChange < 0) ? Icons.arrow_drop_down_rounded : Icons.arrow_drop_up_rounded,
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
              Container(
                height: 16,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
              Text(
                (quotation.pctChange < 0)
                    ? CurrencyFormatter.format(quotation.varBid, selectedCurrencyCode)
                    : "+${CurrencyFormatter.format(quotation.varBid, selectedCurrencyCode)}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: (quotation.pctChange < 0) ? Colors.red : Colors.green,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(heigth: 18, width: 0),
          FittedBox(
            child: Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      child: const Icon(Icons.trending_up_rounded, color: Colors.black, size: 16),
                    ),
                    const Gap(heigth: 0, width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kFontDescriptionColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(quotation.high, selectedCurrencyCode),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(heigth: 0, width: 26),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      child: const Icon(Icons.trending_down_rounded, color: Colors.black, size: 16),
                    ),
                    const Gap(heigth: 0, width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Baixa",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kFontDescriptionColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(quotation.low, selectedCurrencyCode),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
