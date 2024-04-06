import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/interactor/models/currency.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:routefly/routefly.dart';

class CurrenciesBottomSheet extends StatelessWidget {
  const CurrenciesBottomSheet({
    super.key,
    required this.allCurrencies,
    required this.onSelectCurrency,
  });

  final List<Currency> allCurrencies;
  final void Function(Currency) onSelectCurrency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Selecione sua moeda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () => Routefly.pop(context),
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
                ),
                child: const Text(
                  'Fechar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Gap(heigth: 24, width: 0),
          Expanded(
            child: ListView.separated(
              itemCount: allCurrencies.length,
              separatorBuilder: (_, __) => Divider(
                color: Colors.grey.withOpacity(0.1),
              ),
              itemBuilder: (context, index) {
                final currency = allCurrencies[index];
                return ListTile(
                  onTap: () {
                    onSelectCurrency(currency);
                    Routefly.pop(context);
                  },
                  leading: Text(
                    currency.code,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  title: Text(
                    currency.currency,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
