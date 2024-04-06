import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:quotation_currency_app/app/(public)/home/components/card_box.component.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/app/interactor/atoms/currency_atoms.dart';
import 'package:quotation_currency_app/app/interactor/atoms/quotation_atoms.dart';
import 'package:quotation_currency_app/app/interactor/dtos/input/quotation_details_dto.dart';
import 'package:quotation_currency_app/app/utils/constants/styles.dart';
import 'package:quotation_currency_app/routes.dart';
import 'package:routefly/routefly.dart';

class QuotationPagee extends StatelessWidget {
  const QuotationPagee({super.key});

  @override
  Widget build(BuildContext context) {
    final quotations = context.select(() => allQuoations);
    final currency = context.select(() => selectedCurrency);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 70,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Gap(heigth: 32, width: 0),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Routefly.pop(context);
                          },
                          style: ButtonStyle(
                            shape: const MaterialStatePropertyAll(
                              CircleBorder(),
                            ),
                            side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.grey.withOpacity(0.1)),
                            ),
                            padding: const MaterialStatePropertyAll(EdgeInsets.all(18)),
                            overlayColor: MaterialStatePropertyAll(kPrimaryColor.withOpacity(0.05)),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                        const Gap(heigth: 0, width: 12),
                        const Text(
                          'Moedas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: quotations.length,
              itemBuilder: (context, index) {
                final quotation = quotations[index];
                return CardBox(
                  quotation: quotation,
                  currency: currency,
                  onTap: () {
                    Routefly.pushNavigate(
                      routePaths.details,
                      arguments: QuotationDetailDTO(quotation: quotation, codeIn: selectedCurrency.code),
                    );
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: Gap(heigth: 24, width: 0),
          ),
        ],
      ),
    );
  }
}
