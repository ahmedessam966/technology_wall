import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/about/accreditation/mobile/mobile_accreditation_body.dart';
import 'package:technology_wall/en/about/accreditation/tablet/tablet_accrediation_body.dart';
import 'package:technology_wall/en/about/accreditation/web/web_accreditation_body.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header/web_header.dart';
import '../../shared/web/direct_dependencies_index.dart';

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
    metadataFunctions.updateHElement(
        'Technology Wall Accreditation Page',
        'Discover and learn about our partnership with HCC Middle East FZCO for SAP ERP Solutions retail and implementation services.',
        null);
    metadataFunctions.updateMetaData('Technology Wall | Accreditation',
        'Technology Wall Accreditation Page. Learn more about our partnership with HCC Middle East for implementing SAP ERP Solutions.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Accreditation Page\n SAP ERP Accreditation \n Learn more about our partnership with HCC Middle East for supplying and implementing SAP Business One ERP Solutions. \n To ensure reliable quality and a competitve performance, Technology Wall sought to be a certified operator of SAP Business One ERP Solutions in Saudi Arabia. Powered by HCC Middle East, a certfied SAP Soultions provider in Dubai, United Arab Emirates, Technology Wall has made it possible to provide excelsior SAP implementation services and consultations. \n Enriching the market with strong partnerships. \n As part of our vision, Technology Wall is committed to providing top-level service qualities regardless of the required task. Every client is just as valuable as the next. At Technology Wall, we relentlessy seek flexible accommodations to suffice each and every business requirement. We understand VALUE, which is why our operations are always audited with international quality standardizations that ultimately benefits our strategic partners, potential partners and prospects, and our clients.',
        'en');
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
        keyboardScrollConfig: const KeyboardScrollConfig(spaceScrollAmount: 0),
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
                      padding: EdgeInsets.symmetric(horizontal: sw <= 568 ? 3.w : 6.w, vertical: 2.h),
                      child: sw >= 1080
                          ? const WebHeader()
                          : sw < 1080 && sw >= 568
                              ? TabletHeader(
                                  sw: sw,
                                  sh: sh,
                                  ar: ar,
                                )
                              : const MobileHeader(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: sw >= 1080
                          ? const WebAccreditationBody()
                          : sw < 1080 && sw >= 568
                              ? const TabletAccreditationBody()
                              : const MobileAccreditationBody(),
                    ),
                    sw >= 1080
                        ? const WebFooter()
                        : sw < 1080 && sw >= 568
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
