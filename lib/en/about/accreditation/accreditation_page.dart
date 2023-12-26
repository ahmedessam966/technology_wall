import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/en/about/accreditation/mobile/mobile_accreditation_body.dart';
import 'package:technology_wall/en/about/accreditation/tablet/tablet_accrediation_body.dart';
import 'package:technology_wall/en/about/accreditation/web/web_accreditation_body.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/controllers/metadata_controllers.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header.dart';

class AccreditationPage extends StatefulWidget {
  const AccreditationPage({super.key});

  @override
  State<AccreditationPage> createState() => _AccreditationPageState();
}

class _AccreditationPageState extends State<AccreditationPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | Accreditation',
        'Technology Wall Accreditation Page. Learn more about our partnership with HCC Middle East for implementing SAP ERP Solutions.');
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
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppTheme.darkest,
              onPressed: () {},
              child: const Icon(
                Icons.chat_rounded,
                color: Colors.white70,
              ),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.05,
                  child: SvgPicture.asset(
                    'assets/icons/ttten.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                ListView(
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
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                      child: sw >= 1280
                          ? const WebAccreditationBody()
                          : sw < 1280 && sw >= 768
                              ? const TabletAccreditationBody()
                              : const MobileAccreditationBody(),
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
              ],
            )),
      ),
    );
  }
}
