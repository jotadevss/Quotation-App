import 'package:auto_injector/auto_injector.dart';
import 'package:quotation_currency_app/app/data/repositories/api/http_pair_repository.dart';
import 'package:quotation_currency_app/app/data/repositories/api/http_quotation_repository.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/pair_repository.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/quotation_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  injector.add<IQuotationRepository>(HttpQuotationRepository.new);
  injector.add<IPairRepository>(HttpPairRepository.new);
}
