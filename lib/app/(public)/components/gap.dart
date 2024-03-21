import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, required this.heigth, required this.width});

  final double? heigth;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth ?? 8,
      width: width ?? 8,
    );
  }
}
