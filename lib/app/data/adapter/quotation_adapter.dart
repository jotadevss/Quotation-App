import 'dart:convert';

import 'package:quotation_currency_app/app/interactor/models/quotation.dart';

class QuotationAdapter {
  static Quotation fromMap(Map<String, dynamic> map) {
    return Quotation(
      code: map['code'] as String,
      currecy: map['name'] as String,
      value: double.parse(map['bid']),
      pctChange: double.parse(map['pctChange']),
      varBid: double.parse(map['varBid']),
      high: double.parse(map['high']),
      low: double.parse(map['low']),
    );
  }

  static Quotation fromJson(String source) => fromMap(jsonDecode(source) as Map<String, dynamic>);
}
