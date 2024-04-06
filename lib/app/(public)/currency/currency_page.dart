import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/(public)/currency/components/currency_label.component.dart';
import 'package:quotation_currency_app/app/interactor/actions/currency_actions.dart';
import 'package:quotation_currency_app/app/interactor/atoms/currency_atoms.dart';
import 'package:quotation_currency_app/app/utils/constants/currencies.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:quotation_currency_app/routes.dart';
import 'package:routefly/routefly.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currency = context.select(() => selectedCurrencyState$.value);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const LabelCurrency(
              title: 'Cotação Hoje',
              iconPath: 'lib/assets/icons/mini-logo.svg',
              subtitle: 'Acompanhe o preço das moedas mais valiosas do mundo em tempo real.',
            ),
            const Spacer(flex: 1),
            const Text(
              'Selecione sua moeda',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kFontDescriptionColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(heigth: 12, width: 0),
            ListTile(
              onTap: () => showCurrenciesAction(context, mainCurrencies),
              tileColor: Colors.grey.withOpacity(0.05),
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
              leading: Text(
                currency.code,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              title: Text(
                currency.currency,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
              ),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: () {
                Routefly.push(routePaths.home);
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(Color(0xFF292929)),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 52, vertical: 22)),
                overlayColor: MaterialStatePropertyAll(Color(0xFF292929)),
              ),
              child: const Text(
                'Continuar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
