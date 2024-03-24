import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quotation_currency_app/app/(public)/shared/components/gap.dart';
import 'package:quotation_currency_app/routes.dart';
import 'package:routefly/routefly.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Routefly.push(routePaths.currency);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('lib/assets/icons/logo.svg'),
            const Gap(heigth: 42, width: 100),
            const SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                color: Color(0xFFEBD93E),
                borderRadius: BorderRadius.all(Radius.circular(99)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
