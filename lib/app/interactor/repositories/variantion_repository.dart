import 'package:quotation_currency_app/app/interactor/models/variation.dart';

abstract class IVariationRepository {
  Future<List<Variantion>> getLastVariations(int lastDays, String pair);
}
