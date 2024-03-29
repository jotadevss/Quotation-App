import 'dart:convert';
import 'package:quotation_currency_app/app/data/adapter/variation_adapter.dart';
import 'package:quotation_currency_app/app/interactor/models/variation.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/variantion_repository.dart';
import 'package:http/http.dart' as http;

class HttpVariationRepository implements IVariationRepository {
  final _client = http.Client();
  final _baseUrl = "https://economia.awesomeapi.com.br/json/daily";

  @override
  Future<List<Variantion>> getLastVariations(int lastDays, String pair) async {
    try {
      final params = "/$pair/$lastDays";

      final response = await _client.get(Uri.parse("$_baseUrl$params"));

      if (response.statusCode != 200) throw http.ClientException(response.body);

      final data = jsonDecode(response.body) as List<dynamic>;

      final variations = data.map((e) => VariationAdapter.fromMap(e as Map<String, dynamic>)).toList();

      return variations;
    } catch (e) {
      throw Exception(e);
    }
  }
}
