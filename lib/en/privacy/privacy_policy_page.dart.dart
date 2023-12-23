// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/core/controllers/metadata_controllers.dart';
import 'package:technology_wall/en/privacy/mobile/mobile_privacy_body.dart';
import 'package:technology_wall/en/privacy/tablet/tablet_privacy_body.dart';
import 'package:technology_wall/en/privacy/web/web_privacy_body.dart';

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
    metadataFunctions.updateMetaData('Technology Wall | Privacy Center',
        'This page contains acknowledgements, terms of service, and Technology Wall\'s privacy policy.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();

    return Semantics(
      label: 'Technology Wall | Privacy Center',
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
                      ? const WebPrivacyBody()
                      : sw < 1280 && sw >= 768
                          ? const TabletPrivacyBody()
                          : const MobilePrivacyBody(),
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
