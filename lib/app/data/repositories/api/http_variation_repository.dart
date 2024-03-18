import 'dart:convert';

import 'package:quotation_currency_app/app/interactor/models/variation.dart';
import 'package:quotation_currency_app/app/interactor/repositories/variantion_repository.dart';
import 'package:http/http.dart' as http;
import 'package:quotation_currency_app/app/utils/extensions/formatter.extensions.dart';

class HttpVariationRepository implements IVariationRepository {
  final _client = http.Client();
  final _baseUrl = "https://economia.awesomeapi.com.br/json/daily";

  @override
  Future<List<Variantion>> getLastVariations(int lastDays, String code, String codeIn) async {
    try {
      final params = "/${code.over(codeIn)}/$lastDays";

      final response = await _client.get(Uri.parse("$_baseUrl$params"));

      if (response.statusCode != 200) throw http.ClientException(response.body);

      final data = jsonDecode(response.body) as List<dynamic>;

      final variations = data.map((e) => Variantion.fromMap(e as Map<String, dynamic>)).toList();

      return variations;
    } catch (e) {
      throw Exception(e);
    }
  }
}
