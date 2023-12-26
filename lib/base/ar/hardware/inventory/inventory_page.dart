import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import '../../shared/mobile/ar_mobile_footer.dart';
import '../../shared/mobile/ar_mobile_header.dart';
import '../../shared/tablet/ar_tablet_footer.dart';
import '../../shared/tablet/ar_tablet_header.dart';
import '../../shared/web/ar_web_footer.dart';
import '../../shared/web/ar_web_header.dart';
import 'mobile/ar_mobile_inventory_body.dart';
import 'tablet/ar_tablet_inventory_body.dart';
import 'web/ar_web_inventory_body.dart';

class ARInventoryPage extends StatefulWidget {
  const ARInventoryPage({super.key});

  @override
  State<ARInventoryPage> createState() => _ARInventoryPageState();
}

class _ARInventoryPageState extends State<ARInventoryPage> {
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
            body: ListView(
              controller: scroller,
              physics: const RangeMaintainingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 30 : 80, vertical: 20),
                  child: sw >= 1280
                      ? const ARWebHeader()
                      : sw < 1280 && sw >= 768
                          ? ARTabletHeader(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            )
                          : ARMobileHeader(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: sw >= 1280
                      ? const ARWebInventoryBody()
                      : sw < 1280 && sw >= 768
                          ? const ARTabletInventoryBody()
                          : ARMobileInventoryBody(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            ),
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
    );
  }
}
