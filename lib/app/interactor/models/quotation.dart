// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Quotation {
  final String code;
  final String currecy;
  final double value;
  final double pctChange;
  final double varBId;
  final double high;
  final double low;

  Quotation({
    required this.code,
    required this.currecy,
    required this.value,
    required this.pctChange,
    required this.varBId,
    required this.high,
    required this.low,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'currecy': currecy,
      'value': value,
      'pctChange': pctChange,
      'varBId': varBId,
      'high': high,
      'low': low,
    };
  }

  factory Quotation.fromMap(Map<String, dynamic> map) {
    return Quotation(
      code: map['code'] as String,
      currecy: map['currecy'] as String,
      value: map['value'] as double,
      pctChange: map['pctChange'] as double,
      varBId: map['varBId'] as double,
      high: map['high'] as double,
      low: map['low'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quotation.fromJson(String source) => Quotation.fromMap(json.decode(source) as Map<String, dynamic>);
}
