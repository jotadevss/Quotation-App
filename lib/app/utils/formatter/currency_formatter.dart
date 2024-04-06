import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(double number, String currentCode, [bool enableNotation = false]) {
    String numberFormatted = "";
    final symbols = {'BRL': "R\$", 'EUR': "€", 'USD': "\$"};

    if (enableNotation) {
      final formatted = NumberFormat //
              .compactSimpleCurrency()
          .format(number);

      final chars = formatted.split("");
      chars.remove("\$");
      chars.insert(0, symbols[currentCode] ?? "");
      numberFormatted = chars.join();
    } else {
      numberFormatted = NumberFormat //
              .currency(symbol: symbols[currentCode])
          .format(number);
    }

    return numberFormatted;
  }
}
