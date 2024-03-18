import 'package:quotation_currency_app/app/interactor/models/quotation.dart';

abstract class IQuotationRepository {
  Future<List<Quotation>> getAllQuotations(List<String> codes, String codeIn);
  Future<Quotation> getQuotation(String code, String codeIn);
}
