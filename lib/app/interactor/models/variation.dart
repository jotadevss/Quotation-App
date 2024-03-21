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

  factory Variantion.fromMap(Map<String, dynamic> map) {
    return Variantion(
      code: map['code'].toString(),
      codeIn: map['codein'].toString(),
      value: double.parse(map['bid']),
      pctChange: double.parse(map['pctChange']),
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(map['timestamp'])),
    );
  }

  factory Variantion.fromJson(String source) => Variantion.fromMap(json.decode(source) as Map<String, dynamic>);
}
