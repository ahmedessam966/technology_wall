import 'package:flutter/material.dart';
import 'package:technology_wall/core/models/printer_model.dart';

class MobilePrinterDetailsBody extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  final PrinterModel printer;
  const MobilePrinterDetailsBody(
      {super.key, required this.sw, required this.sh, required this.ar, required this.printer});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
