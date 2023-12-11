import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/hardware/printers/web/printers_web_body.dart';

import '../../core/controllers/app_controllers.dart';
import '../../core/widgets/mobile/mobile_footer.dart';
import '../../core/widgets/mobile/mobile_header.dart';
import '../../core/widgets/non_web_drawer.dart';
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
    Provider.of<InventoryControllers>(context, listen: false).printersList.clear();
    return PopScope(
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
          key: sw < 1440 ? provider.nonWebScaffoldKey : null,
          drawer: sw < 1440 ? NonWebDrawer(width: sw) : null,
          body: ListView(
            controller: scroller,
            physics: const RangeMaintainingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: sw >= 1440
                    ? const WebHeader()
                    : sw < 1440 && sw >= 768
                        ? TabletHeader(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          )
                        : const MobileHeader(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: sw >= 1440
                    ? const WebHardwareBody()
                    : sw < 1440 && sw >= 768
                        ? const SizedBox()
                        : const SizedBox(),
              ),
              sw >= 1440
                  ? const WebFooter()
                  : sw < 1440 && sw >= 768
                      ? TabletFooter(
                          sw: sw,
                          sh: sh,
                          ar: ar,
                        )
                      : const MobileFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
