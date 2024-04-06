import 'package:asp/asp.dart';
import 'package:quotation_currency_app/app/interactor/actions/variation_action.dart';
import 'package:quotation_currency_app/app/interactor/models/variation.dart';

final variationState$ = Atom<List<Variantion>>([]);

List<Variantion> get reversedVariations {
  if (variationState$.value.isEmpty) return [];
  final values = variationState$.value.reversed.toList();
  return values;
}

List<double> get valuesVariationY {
  if (variationState$.value.isEmpty) return [];

  final values = reversedVariations.map((e) => e.value).toList();

  final slicedValues = sliced(values, 4);
  return slicedValues;
}

List<double> get valuesInRange {
  if (variationState$.value.isEmpty && valuesVariationY.isEmpty) return [];

  final values = reversedVariations.map((e) => e.value).toList();

  final mapRangePoint = mapperPoint(valuesVariationY);
  final valuesRange = rangeValues(values, mapRangePoint);
  return valuesRange;
}
