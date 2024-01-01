import 'package:flutter/material.dart';
import 'package:technology_wall/global/models/printer_model.dart';

class ARTabletPrinterDetailsBody extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  final PrinterModel? printer;
  const ARTabletPrinterDetailsBody(
      {super.key, required this.sw, required this.sh, required this.ar, required this.printer});

  @override
  Widget build(BuildContext context) {
    return const Directionality(textDirection: TextDirection.rtl, child: SizedBox());
  }
}
