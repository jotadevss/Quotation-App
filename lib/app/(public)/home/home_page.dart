import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/home/components/home_app_bar.component.dart';
import 'package:quotation_currency_app/app/(public)/home/components/home_card_box.component.dart';
import 'package:quotation_currency_app/app/(public)/home/components/home_main_card.component.dart';
import 'package:quotation_currency_app/app/(public)/shared/skeletons/home_skeleton.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/interactor/actions/currency_actions.dart';
import 'package:quotation_currency_app/app/interactor/actions/quotation_actions.dart';
import 'package:quotation_currency_app/app/interactor/atoms/currency_atoms.dart';
import 'package:quotation_currency_app/app/interactor/atoms/global_atoms.dart';
import 'package:quotation_currency_app/app/interactor/atoms/quotation_atoms.dart';
import 'package:quotation_currency_app/app/interactor/dtos/input/quotation_details_dto.dart';
import 'package:quotation_currency_app/app/utils/constants/currencies.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:quotation_currency_app/routes.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final selectedCurrency$ = selectedCurrencyState$.value;
    getAllQuotation(selectedCurrency$.code);
  }

  @override
  Widget build(BuildContext context) {
    // states
    final selectedCurrency$ = context.select(() => selectedCurrencyState$.value);
    final currency$ = context.select(() => selectedCurrencyState$.value);
    final isLoading$ = context.select(() => loadingState$.value);
    final quotations$ = context.select(() => quotationsState$.value);

    // observer
    rxObserver(() => selectedCurrency$, effect: (c) {
      if (c!.code != currency$.code) {
        getAllQuotation(selectedCurrency$.code);
      }
    });

    // Widgets Tree
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                AppBarHome(
                  currency: currency$,
                  isLoading: isLoading$,
                  onTap: () => showCurrencies(context, mainCurrencies),
                  onRefresh: () => getAllQuotation(currency$.code),
                ),
                (isLoading$)
                    ? const SkeletonHome()
                    : Column(
                        children: [
                          const Gap(heigth: 26, width: 0),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Maior alta hoje",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Gap(heigth: 24, width: 0),
                          MainCard(
                            currency: highestQuote?.currecy ?? "",
                            code: highestQuote?.code ?? "",
                            selectedCurrencyCode: selectedCurrency$.code,
                            value: highestQuote?.value ?? 0.0,
                            pctChange: highestQuote?.pctChange ?? 0.0,
                            onTap: () {
                              Routefly.pushNavigate(
                                routePaths.details,
                                arguments: QuotationDetailDTO(quotation: highestQuote ?? quotations$[0], codeIn: selectedCurrency$.code),
                              );
                            },
                          ),
                          const Gap(heigth: 24, width: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Moedas",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Routefly.push(routePaths.quotation);
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.1)),
                                ),
                                child: const Text(
                                  'Ver mais',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                if (quotations$.isEmpty) return Container();
                                final quotation = quotations$[index];
                                return CardBox(
                                  quotation: quotation,
                                  currency: currency$,
                                  onTap: () {
                                    Routefly.pushNavigate(
                                      routePaths.details,
                                      arguments: QuotationDetailDTO(quotation: quotation, codeIn: selectedCurrency$.code),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                              decoration: BoxDecoration(
                                border: Border.all(color: kFontDescriptionColor.withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Conversor',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Converter entre moedas com um\nsimples toque.',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: kFontDescriptionColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.swap_horiz_rounded,
                                    color: Colors.black,
                                    size: 32,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
