import 'package:asp/asp.dart';
import 'package:quotation_currency_app/app/interactor/actions/variation_action.dart';
import 'package:quotation_currency_app/app/interactor/models/variation.dart';

final variationState$ = Atom<List<Variantion>>([]);

List<Variantion> get reversedVariations {
  if (variationState$.value.isEmpty) return [];
  final values = variationState$.value.reversed.toList();
  return values;
}

List<double> get valuesVariationToChart {
  if (variationState$.value.isEmpty) return [];

  final values = reversedVariations.map((e) => e.value).toList();

  final slicedValues = slicedValueVariantionAction(values, 4);
  return slicedValues;
}

List<double> get valuesInRangeToChart {
  if (variationState$.value.isEmpty && valuesVariationToChart.isEmpty) return [];

  final values = reversedVariations.map((e) => e.value).toList();

  final mapRangePoint = mapperPointValueVariationAction(valuesVariationToChart);
  final valuesRange = rangeValuesVariationToChartAction(values, mapRangePoint);
  return valuesRange;
}
