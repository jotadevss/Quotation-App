import 'package:quotation_currency_app/app/interactor/dtos/output/pair_dto.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';

abstract class IQuotationRepository {
  Future<List<Quotation>> getAllQuotations(List<PairDTO> pairs);
  Future<Quotation> getQuotation(String code, String codeIn);
}
