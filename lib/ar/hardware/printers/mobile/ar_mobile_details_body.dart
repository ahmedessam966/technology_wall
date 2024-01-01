import 'package:flutter/material.dart';
import 'package:technology_wall/global/models/product_model.dart';

class ARMobilePrinterDetailsBody extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  final ProductModel printer;
  const ARMobilePrinterDetailsBody(
      {super.key, required this.sw, required this.sh, required this.ar, required this.printer});

  @override
  Widget build(BuildContext context) {
    return const Directionality(textDirection: TextDirection.rtl, child: SizedBox());
  }
}
