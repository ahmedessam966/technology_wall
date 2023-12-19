import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/software/sap/web/web_sap_body.dart';
import '/core/widgets/mobile/mobile_footer.dart';
import '/core/widgets/mobile/mobile_header.dart';
import '/core/widgets/mobile/non_web_drawer.dart';
import '/core/widgets/tablet/tablet_footer.dart';
import '/core/widgets/tablet/tablet_header.dart';
import '/core/widgets/web/web_footer.dart';
import '/core/widgets/web/web_header.dart';

class SAPPage extends StatefulWidget {
  const SAPPage({super.key});

  @override
  State<SAPPage> createState() => _SAPPageState();
}

class _SAPPageState extends State<SAPPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     AppControllers.showAppBanner(
  //         context, MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();

    return Semantics(
      link: true,
      label: 'Technology Wall | SAP ERP Page',
      value:
          "SAP Business One, SAP, Tally ERP, ERP, erp, sap, sap business one, s4/hana, sap4, sap4/hana, s4hana, s4hana erp",
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
                      ? const WebSAPBody()
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
