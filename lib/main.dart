import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/app.dart';
import 'package:quotation_currency_app/app/injector.dart';

void main() {
  registerInstances();

  runApp(const RxRoot(child: App()));
}
