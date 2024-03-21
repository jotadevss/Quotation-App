import 'dart:convert';

class Quotation {
  final String code;
  final String currecy;
  final double value;
  final double pctChange;
  final double varBid;
  final double high;
  final double low;

  Quotation({
    required this.code,
    required this.currecy,
    required this.value,
    required this.pctChange,
    required this.varBid,
    required this.high,
    required this.low,
  });

  factory Quotation.fromMap(Map<String, dynamic> map) {
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

  factory Quotation.fromJson(String source) => Quotation.fromMap(json.decode(source) as Map<String, dynamic>);
}
