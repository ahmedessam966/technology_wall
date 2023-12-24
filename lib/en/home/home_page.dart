import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/en/shared/web/cookie_popup.dart';
import '../../config/cookie_jars.dart';
import '../../core/controllers/metadata_controllers.dart';
import '../shared/mobile/mobile_footer.dart';
import '../shared/mobile/mobile_header.dart';
import '../shared/tablet/tablet_footer.dart';
import '../shared/tablet/tablet_header.dart';
import '../shared/web/web_footer.dart';
import '../shared/web/web_header.dart';
import 'mobile/mobile_home_body.dart';
import 'tablet/tablet_home_body.dart';
import 'web/web_home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | Home',
        'Technology Wall Home Page. Browse and explore our unique-quality services including software implementations for SAP and Microsoft. Find the best-performing hardware devices for your enteprise from renowned brands such as Dell, HP, Canon, Apple, and much more.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();

    return Semantics(
      link: true,
      label: 'Technology Wall Home Page',
      value:
          "tech-wall, tech-wall.me, techwall.me, techwall, techwallme, techwall co., tech-wall co., SAP Business One, SAP, Tally ERP, ERP, erp, tally, sap, sap business one, sage, Sage, Sage ERP, sage erp, s4/hana, sap4, sap4/hana, s4hana, s4hana erp, hp, dell, canon, hp printers, dell printers, hp servers, dell servers, dell pc, hp pc, dell laptop, dell notebook, hp notebook,contact us",
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
                  padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 30 : 80, vertical: sh * 0.04),
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
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.1.h),
                  child: sw >= 1280
                      ? const WebHomeBody()
                      : sw < 1280 && sw >= 768
                          ? TabletHomeBody(
                              sw: sw,
                              sh: sh,
                              ar: ar,
                            )
                          : const MobileHomeBody(),
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
