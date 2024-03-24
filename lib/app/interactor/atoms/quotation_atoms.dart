import 'package:asp/asp.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';

final quotationsState$ = Atom<List<Quotation>>([]);

// Getters
List<Quotation> get allQuoations => quotationsState$.value;

Quotation? get highestQuote {
  if (allQuoations.isEmpty) return null;

  Quotation highest = allQuoations[0];

  for (var quote in allQuoations) {
    if (quote.varBid > highest.varBid) {
      highest = quote;
    }
  }

  return highest;
}
