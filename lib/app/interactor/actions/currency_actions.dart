import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/bottom_sheet_currency.component.dart';
import 'package:quotation_currency_app/app/interactor/atoms/currency_atoms.dart';
import 'package:quotation_currency_app/app/interactor/models/currency.dart';

void setSelectedCurrency(Currency currency) {
  selectedCurrencyState$.value = currency;
}

void showCurrencies(BuildContext context, List<Currency> currencies) {
  final heigthScreen = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: heigthScreen / 2),
    builder: (context) => CurrenciesBottomSheet(
      allCurrencies: currencies,
      onSelectCurrency: setSelectedCurrency,
    ),
  );
}
