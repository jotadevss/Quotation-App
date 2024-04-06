import 'package:quotation_currency_app/app/injector.dart';
import 'package:quotation_currency_app/app/interactor/actions/global_action.dart';
import 'package:quotation_currency_app/app/interactor/atoms/quotation_atoms.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/pair_repository.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/quotation_repository.dart';
import 'package:quotation_currency_app/app/interactor/dtos/output/pair_dto.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';

void setQuotationsAction(List<Quotation> quotations) {
  quotationsState$.value = quotations;
}

Future<void> getAllQuotationAction(String codeIn) async {
  setLoadingAction(true);

  final pairRepository = injector.get<IPairRepository>();
  final quotationRepository = injector.get<IQuotationRepository>();

  final pairs = await pairRepository.getPairs(codeIn) as List<PairDTO>;
  final quotations = await quotationRepository.getAllQuotations(pairs);
  print(quotations);
  setQuotationsAction(quotations);

  setLoadingAction(false);
}
