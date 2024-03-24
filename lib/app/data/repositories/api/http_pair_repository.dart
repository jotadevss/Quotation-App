import 'dart:convert';

import 'package:quotation_currency_app/app/interactor/dtos/output/pair_dto.dart';
import 'package:quotation_currency_app/app/interactor/contracts/repositories/pair_repository.dart';
import 'package:http/http.dart' as http;

class HttpPairRepository implements IPairRepository<PairDTO> {
  final _client = http.Client();
  final _baseUrl = "https://economia.awesomeapi.com.br/JSON/available";

  @override
  Future<List<PairDTO>> getPairs(String codeIn) async {
    try {
      final response = await _client.get(Uri.parse(_baseUrl));

      if (response.statusCode != 200) throw http.ClientException(response.body);

      final map = jsonDecode(response.body) as Map<String, dynamic>;

      final keys = map //
          .keys
          .toList();

      final spplited = keys //
          .map((k) => k.split('-'))
          .toList();

      final pairs = <PairDTO>[];

      for (var element in spplited) {
        if (element[1] == codeIn) {
          final pair = "${element[0]}-$codeIn";
          final pairDto = PairDTO(pair: pair);
          pairs.add(pairDto);
        }
      }

      return pairs;
    } catch (e) {
      throw Exception(e);
    }
  }
}
