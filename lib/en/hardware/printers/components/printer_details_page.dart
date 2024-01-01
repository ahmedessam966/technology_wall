import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/global/models/product_model.dart';
import '../../../shared/mobile/mobile_footer.dart';
import '../../../shared/tablet/tablet_footer.dart';
import '../../../shared/web/web_footer.dart';
import '../mobile/mobile_details_body.dart';
import '../tablet/tablet_details_body.dart';
import '../web/web_printer_details_body.dart';

class PrinterDetailsPage extends StatefulWidget {
  final ProductModel printer;
  const PrinterDetailsPage({super.key, required this.printer});

  @override
  State<PrinterDetailsPage> createState() => _PrinterDetailsPageState();
}

late ProductModel printer;

class _PrinterDetailsPageState extends State<PrinterDetailsPage> {
  @override
  void initState() {
    printer = widget.printer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();
    return Semantics(
      label: '${printer.brand} ${printer.model}',
      value: '${printer.brand}, ${printer.model}, ${printer.family}, ${printer.type}, printer',
      child: PopScope(
        canPop: true,
        onPopInvoked: (value) {
          if (value) {
            return;
          } else {
            Navigator.of(context).pop();
          }
        },
        child: ImprovedScrolling(
          scrollController: scroller,
          enableMMBScrolling: true,
          enableKeyboardScrolling: true,
          child: Scaffold(
            body: ListView(
              controller: scroller,
              physics: const RangeMaintainingScrollPhysics(),
              children: [
                sw >= 1280
                    ? WebPrinterDetailsBody(printer: printer)
                    : sw < 1280 && sw >= 768
                        ? TabletPrinterDetailsBody(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                            printer: printer,
                          )
                        : MobilePrinterDetailsBody(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                            printer: printer,
                          ),
                sw >= 1280
                    ? const WebFooter()
                    : sw < 1280 && sw >= 768
                        ? TabletFooter(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          )
                        : MobileFooter(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
