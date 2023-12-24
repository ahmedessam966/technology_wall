// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/core/controllers/metadata_controllers.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header.dart';
import 'mobile/mobile_inventory_body.dart';
import 'tablet/tablet_inventory_body.dart';
import 'web/web_inventory_body.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();

  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | Hardware',
        'A wide selection of hardware and devices that are essential for driving your digital business forward. Offering brands such as HP, Dell, Canon, and much more.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();
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
                        : const MobileHeader(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: sw >= 1280
                    ? const WebInventoryBody()
                    : sw < 1280 && sw >= 768
                        ? const TabletInventoryBody()
                        : const MobileInventoryBody(),
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
    );
  }
}
