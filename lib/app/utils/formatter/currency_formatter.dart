import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(double number, String currentSymbol) {
    String symbol = (currentSymbol == "BRL") ? "R\$" : "\$";

    return NumberFormat.currency(locale: "pt_BR", symbol: symbol).format(number);
  }
}
