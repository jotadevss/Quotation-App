import 'dart:convert';

import 'package:quotation_currency_app/app/interactor/models/variation.dart';

class VariationAdapter {
  static Variantion fromMap(Map<String, dynamic> map) {
    return Variantion(
      code: map['code'].toString(),
      codeIn: map['codein'].toString(),
      value: double.parse(map['bid']),
      pctChange: double.parse(map['pctChange']),
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(map['timestamp']) * 1000),
    );
  }

  static Variantion fromJson(String source) => fromMap(jsonDecode(source) as Map<String, dynamic>);
}
