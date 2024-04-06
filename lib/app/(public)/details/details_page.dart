// ignore: file_names
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/details/components/details_app_bar.component.dart';
import 'package:quotation_currency_app/app/(public)/details/components/details_card.component.dart';
import 'package:quotation_currency_app/app/(public)/shared/charts/variation_line_chart.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/interactor/actions/variation_action.dart';
import 'package:quotation_currency_app/app/interactor/atoms/currency_atoms.dart';
import 'package:quotation_currency_app/app/interactor/dtos/input/quotation_details_dto.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:routefly/routefly.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _quotatationDetailDTO = Routefly.query.arguments as QuotationDetailDTO;

  @override
  void initState() {
    super.initState();
    final pair = "${_quotatationDetailDTO.quotation.code}-${_quotatationDetailDTO.codeIn}";
    getAllVariationsAction(pair, 15);
  }

  @override
  Widget build(BuildContext context) {
    // states
    final selectedCurrency$ = context.select(() => selectedCurrencyState$.value);
    final quotation = _quotatationDetailDTO.quotation;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarDetail(quotation: quotation),
                const Gap(heigth: 32, width: 0),
                const Text(
                  "Visão Geral",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(heigth: 6, width: 0),
                const Text(
                  "Acompanhe detalhes gerais da moeda atual",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kFontDescriptionColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(heigth: 18, width: 0),
                CardDetail(
                  quotation: quotation,
                  selectedCurrencyCode: selectedCurrency$.code,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
                const Text(
                  "Variação",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(heigth: 6, width: 0),
                const Text(
                  "Visualize a variação do valor da moedas ao longo do tempo.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kFontDescriptionColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(heigth: 32, width: 0),
                const LineChartVariation(),
                const Gap(heigth: 64, width: 0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
