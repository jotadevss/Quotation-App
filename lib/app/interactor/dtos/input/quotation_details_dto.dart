import 'package:quotation_currency_app/app/interactor/models/quotation.dart';

class QuotationDetailDTO {
  final Quotation quotation;
  final String codeIn;

  QuotationDetailDTO({
    required this.quotation,
    required this.codeIn,
  });
}
