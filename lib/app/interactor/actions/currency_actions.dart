import 'package:quotation_currency_app/app/interactor/atoms/currency_atoms.dart';
import 'package:quotation_currency_app/app/interactor/models/currency.dart';

void setSelectedCurrency(Currency currency) {
  selectedCurrencyState$.value = currency;
}
