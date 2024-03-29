import 'dart:convert';
import 'package:quotation_currency_app/app/data/adapter/quotation_adapter.dart';
import 'package:quotation_currency_app/app/interactor/dtos/output/pair_dto.dart';
import 'package:quotation_currency_app/app/interactor/models/quotation.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/quotation_repository.dart';
import 'package:http/http.dart' as http;
import 'package:quotation_currency_app/app/utils/extensions/formatter.extensions.dart';

class HttpQuotationRepository implements IQuotationRepository {
  final _client = http.Client();
  final _baseUrl = "https://economia.awesomeapi.com.br/last/";

  @override
  Future<List<Quotation>> getAllQuotations(List<PairDTO> pairs) async {
    try {
      final params = pairs //
          .map((p) => p.pair.toUpperCase())
          .toList()
          .join(',');

      final response = await _client.get(Uri.parse("$_baseUrl$params"));

      if (response.statusCode != 200) throw http.ClientException(response.body);

      final map = jsonDecode(response.body) as Map<String, dynamic>;

      final quotation = map // Convert Map to Quotation Object
          .entries
          .map((c) => QuotationAdapter.fromMap(c.value))
          .toList();

      return quotation;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Quotation> getQuotation(String code, String codeIn) async {
    try {
      final params = code.over(codeIn);
      final response = await _client.get(Uri.parse("$_baseUrl$params"));

      if (response.statusCode != 200) throw http.ClientException(response.body);

      final chars = response.body.split('');

      chars.removeWhere((c) => c == "\\");

      final json = chars.join('');
      final map = jsonDecode(json) as Map<String, dynamic>;
      final quotation = map // Convert Map to Quotation Object
          .entries
          .map((c) => QuotationAdapter.fromMap(c.value))
          .toList()[0];

      return quotation;
    } catch (e) {
      throw Exception(e);
    }
  }
}
