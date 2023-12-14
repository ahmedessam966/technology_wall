import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/hardware/inventory/mobile/mobile_inventory_body.dart';
import 'package:technology_wall/hardware/inventory/tablet/tablet_inventory_body.dart';
import 'package:technology_wall/hardware/inventory/web/web_inventory_body.dart';
import '../../core/widgets/mobile/mobile_footer.dart';
import '../../core/widgets/mobile/mobile_header.dart';
import '../../core/widgets/mobile/non_web_drawer.dart';
import '../../core/widgets/tablet/tablet_footer.dart';
import '../../core/widgets/tablet/tablet_header.dart';
import '../../core/widgets/web/web_footer.dart';
import '../../core/widgets/web/web_header.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();

    return Semantics(
      label: 'Technology Wall | Hardware',
      value:
          'HP, Dell, Lenovo, MacBook, Apple, Acer, Asus, Toshiba, HP Notebooks, HP Laptops, Dell Notebooks, Dell Laptops, Lenovo Laptops, Lenovo Notebooks, MacBook Pro, MacBook Notebooks, MacBook Laptops, MacBook Pro Laptops, MacBook Pro Notebooks, Apple Laptops, Apple Notebooks, Acer Laptops, Acer Notebooks, Asus Laptops, Asus Notebooks, Toshiba Laptops, Toshiba Notebooks, Scanners, Fujitsu, Routers, Cisco, Cisco Routers, TP-Link, Switches, UPS, Servers, HP Servers, Dell Servers, HP G Series, HP G10, Dell PowerEdge, HP Workstation, Dell, Workstation, Firewalls, Fortinet, Fortigate, Sophos, CCTV, Cameras, Surveillance, Hik-Vision, NVR, DVR',
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
            // key: sw < 1280 ? provider.nonWebScaffoldKey : null,
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
                      ? const WebInventoryBody()
                      : sw < 1280 && sw >= 768
                          ? const TabletInventoryBody()
                          : MobileInventoryBody(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            ),
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
