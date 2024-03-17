import 'dart:convert';

class Variantion {
  final String code;
  final String codeIn;
  final double value;
  final double pctChange;
  final DateTime date;

  Variantion({
    required this.code,
    required this.codeIn,
    required this.value,
    required this.pctChange,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'codeIn': codeIn,
      'value': value,
      'pctChange': pctChange,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Variantion.fromMap(Map<String, dynamic> map) {
    return Variantion(
      code: map['code'] as String,
      codeIn: map['codeIn'] as String,
      value: map['value'] as double,
      pctChange: map['pctChange'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Variantion.fromJson(String source) => Variantion.fromMap(json.decode(source) as Map<String, dynamic>);
}
