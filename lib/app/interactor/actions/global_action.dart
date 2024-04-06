import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/interactor/atoms/global_atoms.dart';

setLoadingAction(bool value) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    loadingState$.value = value;
  });
}
