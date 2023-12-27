// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/core/controllers/metadata_controllers.dart';
import '../shared/mobile/ar_mobile_footer.dart';
import '../shared/mobile/ar_mobile_header.dart';
import '../shared/tablet/ar_tablet_footer.dart';
import '../shared/tablet/ar_tablet_header.dart';
import '../shared/web/ar_web_footer.dart';
import '../shared/web/ar_web_header.dart';
import 'mobile/ar_mobile_privacy_body.dart';
import 'tablet/ar_tablet_privacy_body.dart';
import 'web/ar_web_privacy_body.dart';

class ARPrivacyPolicyPage extends StatefulWidget {
  const ARPrivacyPolicyPage({super.key});

  @override
  State<ARPrivacyPolicyPage> createState() => _ARPrivacyPolicyPageState();
}

class _ARPrivacyPolicyPageState extends State<ARPrivacyPolicyPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();

  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | مركز الخصوصية',
        'تحتوي هذه الصفحة على إقرارات وشروط الخدمة وسياسة الخصوصية الخاصة بسور التكنولوجيا.');
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
      child: Directionality(
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
            keyboardScrollConfig: const KeyboardScrollConfig(spaceScrollAmount: 0),
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
                        ? const ARWebPrivacyBody()
                        : sw < 1280 && sw >= 768
                            ? const ARTabletPrivacyBody()
                            : const ARMobilePrivacyBody(),
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
      ),
    );
  }
}
