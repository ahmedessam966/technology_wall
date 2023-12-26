import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/base/en/about/mobile/mobile_about_body.dart';
import 'package:technology_wall/base/en/about/tablet/tablet_about_body.dart';
import 'package:technology_wall/base/en/about/web/web_about_body.dart';

import '../../../../core/controllers/metadata_controllers.dart';
import '../../../config/themes/app_theme.dart';
import '../shared/mobile/mobile_footer.dart';
import '../shared/mobile/mobile_header.dart';
import '../shared/tablet/tablet_footer.dart';
import '../shared/tablet/tablet_header.dart';
import '../shared/web/web_footer.dart';
import '../shared/web/web_header.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                          ? const WebAboutBody()
                          : sw < 1280 && sw >= 768
                              ? const TabletAboutBody()
                              : const MobileAboutBody(),
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
