import 'package:flutter/material.dart';
import 'package:technology_wall/global/models/product_model.dart';

class TabletPrinterDetailsBody extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  final ProductModel? printer;
  const TabletPrinterDetailsBody(
      {super.key, required this.sw, required this.sh, required this.ar, required this.printer});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
