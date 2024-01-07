// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/global/controllers/metadata_controllers.dart';
import 'package:technology_wall/en/privacy/mobile/mobile_privacy_body.dart';
import 'package:technology_wall/en/privacy/tablet/tablet_privacy_body.dart';
import 'package:technology_wall/en/privacy/web/web_privacy_body.dart';
import '../../config/themes/app_theme.dart';
import '../shared/mobile/mobile_footer.dart';
import '../shared/mobile/mobile_header.dart';
import '../shared/tablet/tablet_footer.dart';
import '../shared/tablet/tablet_header.dart';
import '../shared/web/web_footer.dart';
import '../shared/web/web_header.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement('Technology Wall Privacy Policy Page',
        'Learn how Technology Wall collects and processes data from clients and website visitors.', null);
    metadataFunctions.updateMetaData('Technology Wall | Privacy',
        'Technology Wall\'s privacy policy and terms of service. This page contains all the essential acknowledgments, waivers, and data collection and processing procedures that may be of any interest to our clients and website visitors.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'We respect your privacy and take the safety of your online shopping seriously. However, in order to be able to provide you with better products, more effective customer service, and personalized updates, we may record a set of information from your visit to the our website. For disclosure and transparency, the following statemnts describe policies and procedures, and how and why your information is collected and used.',
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
                  sw >= 1080
                      ? const WebPrivacyBody()
                      : sw < 1080 && sw >= 568
                          ? const TabletPrivacyBody()
                          : const MobilePrivacyBody(),
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
          ),
        ),
      ),
    );
  }
}
