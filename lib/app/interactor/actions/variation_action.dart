import 'package:quotation_currency_app/app/injector.dart';
import 'package:quotation_currency_app/app/interactor/actions/global_action.dart';
import 'package:quotation_currency_app/app/interactor/atoms/variation_atoms.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/variantion_repository.dart';

Future<void> getAllVariations(String pair, int lastDays) async {
  setLoading(true);
  final repository = injector.get<IVariationRepository>();
  final variations = await repository.getLastVariations(lastDays, pair);
  variationState$.value = variations;
  setLoading(false);
}

List<double> sliced(List<double> list, int length) {
  final intervalList = <double>[];

  list.sort();

  // get first element
  final firstValue = list[0] - (list[0] * 0.3);
  intervalList.add(firstValue);

  // remove the first and next element the in stack sorted list
  list.removeAt(0);
  list.removeAt(0);

  // get last element
  final lastValue = list[list.length - 1] + (list[list.length - 1] * 0.1);
  intervalList.add(lastValue);

  // remove the last and previous element the in stack sorted list
  list.removeAt(list.length - 1);
  list.removeAt(list.length - 1);

  if (intervalList.length == length) {
    return intervalList;
  }

  for (var i = 0; i < list.length; i += list.length - 1) {
    intervalList.add(list[i]);
  }

  intervalList.sort();
  return intervalList;
}

Map<int, List<double>> mapperPoint(List<double> sliced) {
  // Create list points
  final points = List.generate(sliced.length, (i) => i + 1);

  // Initialize list
  final range = <List<double>>[];

  /*
      Get the the actual value and next value
      ex:   [1, 2, 3] => [[1, 2], [2, 3], [3, 3]]
  */
  for (var i = 0; i < sliced.length; i++) {
    final slice = sliced[i];

    // Validate the next value
    final nextSlice = (i == sliced.length - 1) ? slice : sliced[i + 1];
    range.add([slice, nextSlice]);
  }

  // Create map
  final map = Map.fromIterables(points, range);

  return map;
}

List<double> rangeValues(List<double> values, Map<int, List<double>> rangePoints) {
  // Initialize list
  final valuesInRange = <double>[];

  for (var value in values) {
    rangePoints.forEach((point, range) {
      /*
          Check if the current value falls within the current 
          range (inclusive lower bound, exclusive upper bound)
      */
      if (value >= range[0] && value < range[1]) {
        // Calculate the result based on the value, point, and lower bound.
        final result = (value * point) / range[0];
        valuesInRange.add(result);
      }

      /*
          Handle edge case: If the range is a single point (lower bound == upper bound) 
          and the value matches the point exactly.
      */
      if (range[0] == range[1] && value == range[0]) {
        valuesInRange.add(point.toDouble());
      }
    });
  }

  return valuesInRange;
}
