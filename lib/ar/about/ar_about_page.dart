import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/ar/about/mobile/ar_mobile_about_body.dart';
import 'package:technology_wall/ar/about/tablet/ar_tablet_about_body.dart';
import 'package:technology_wall/ar/about/web/ar_web_about_body.dart';
import '../../../core/controllers/metadata_controllers.dart';
import '../shared/mobile/ar_mobile_footer.dart';
import '../shared/mobile/ar_mobile_header.dart';
import '../shared/tablet/ar_tablet_footer.dart';
import '../shared/tablet/ar_tablet_header.dart';
import '../shared/web/ar_web_footer.dart';
import '../shared/web/ar_web_header.dart';

class ARAboutPage extends StatefulWidget {
  const ARAboutPage({super.key});

  @override
  State<ARAboutPage> createState() => _ARAboutPageState();
}

class _ARAboutPageState extends State<ARAboutPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | About',
        'Technology Wall Accreditation Page. Learn more about our partnership with HCC Middle East for implementing SAP ERP Solutions.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();
    return Directionality(
      textDirection: TextDirection.rtl,
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
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                  child: sw >= 1280
                      ? const ARWebAboutBody()
                      : sw < 1280 && sw >= 768
                          ? const ARTabletAboutBody()
                          : const ARMobileAboutBody(),
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
