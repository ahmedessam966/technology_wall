import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';

import 'package:technology_wall/core/models/printer_model.dart';
import '../../../shared/mobile/ar_mobile_footer.dart';
import '../../../shared/tablet/ar_tablet_footer.dart';
import '../../../shared/web/ar_web_footer.dart';
import '../mobile/ar_mobile_details_body.dart';
import '../tablet/ar_tablet_details_body.dart';
import '../web/ar_web_prrinter_details_body.dart';

import '../../../../core/controllers/app_controllers.dart';

class ARPrinterDetailsPage extends StatefulWidget {
  final PrinterModel? printer;
  const ARPrinterDetailsPage({super.key, required this.printer});

  @override
  State<ARPrinterDetailsPage> createState() => _ARPrinterDetailsPageState();
}

late PrinterModel? arPrinter;

class _ARPrinterDetailsPageState extends State<ARPrinterDetailsPage> {
  @override
  void initState() {
    arPrinter = widget.printer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final provider = Provider.of<AppControllers>(context, listen: true);
    final scroller = ScrollController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        label: '${arPrinter?.brand} ${arPrinter?.model}',
        value: '${arPrinter?.brand}, ${arPrinter?.model}, ${arPrinter?.family}, ${arPrinter?.type}, printer',
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
              key: sw < 1280 ? provider.nonWebScaffoldKey : null,
              body: ListView(
                controller: scroller,
                physics: const RangeMaintainingScrollPhysics(),
                children: [
                  sw >= 1280
                      ? ARWebPrinterDetailsBody(printer: arPrinter)
                      : sw < 1280 && sw >= 768
                          ? ARTabletPrinterDetailsBody(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                              printer: arPrinter,
                            )
                          : ARMobilePrinterDetailsBody(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                              printer: arPrinter,
                            ),
                  sw >= 1280
                      ? const ARWebFooter()
                      : sw < 1280 && sw >= 768
                          ? ARTabletFooter(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            )
                          : ARMobileFooter(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
