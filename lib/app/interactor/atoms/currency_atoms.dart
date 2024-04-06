import 'package:quotation_currency_app/app/interactor/models/currency.dart';
import 'package:asp/asp.dart';
import 'package:quotation_currency_app/app/utils/constants/currencies.dart';

final selectedCurrencyState$ = Atom<Currency>(mainCurrencies[0]);
