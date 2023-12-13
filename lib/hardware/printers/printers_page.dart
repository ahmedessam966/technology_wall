import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/hardware/printers/web/printers_web_body.dart';

import '../../core/controllers/app_controllers.dart';
import '../../core/widgets/mobile/mobile_footer.dart';
import '../../core/widgets/mobile/mobile_header.dart';
import '../../core/widgets/mobile/non_web_drawer.dart';
import '../../core/widgets/tablet/tablet_footer.dart';
import '../../core/widgets/tablet/tablet_header.dart';
import '../../core/widgets/web/web_footer.dart';
import '../../core/widgets/web/web_header.dart';

class PrintersPage extends StatefulWidget {
  final String? category;
  const PrintersPage({super.key, this.category});

  @override
  State<PrintersPage> createState() => _PrintersPageState();
}

class _PrintersPageState extends State<PrintersPage> {
  @override
  void dispose() {
    Provider.of<InventoryControllers>(context, listen: false).printersList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();
    final provider = Provider.of<AppControllers>(context, listen: true);

    return Semantics(
      link: true,
      label: 'Technology Wall | Printers',
      value:
          'HP Printers, Canon Printers, Epson Printers, Zebra Printers, Printers, Scanners, Copier, Scanner, HP All-In-One, Canon All-In-One, Epson Dot Matrix, Dot Matrix, HP Scanners, HP Copier, Epson Scanners, Network Printers, HP Network Printer',
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
            drawer: sw < 1280
                ? NonWebDrawer(
                    sw: sw,
                    sh: sh,
                    ar: ar,
                  )
                : null,
            body: ListView(
              controller: scroller,
              physics: const RangeMaintainingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 30 : 80, vertical: 20),
                  child: sw >= 1280
                      ? const WebHeader()
                      : sw < 1280 && sw >= 768
                          ? TabletHeader(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            )
                          : MobileHeader(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: sw >= 1280
                      ? const WebHardwareBody()
                      : sw < 1280 && sw >= 768
                          ? const SizedBox()
                          : const SizedBox(),
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
