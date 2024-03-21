import 'package:quotation_currency_app/app/interactor/models/currency.dart';
import 'package:asp/asp.dart';
import 'package:quotation_currency_app/app/utils/constants/currencies.dart';

final selectedCurrencyState$ = Atom<Currency>(currencies[0]);

// Getters
Currency get selectedCurrency => selectedCurrencyState$.value;
