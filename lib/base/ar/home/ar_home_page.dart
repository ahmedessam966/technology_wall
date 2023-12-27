import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/controllers/metadata_controllers.dart';
import '../shared/mobile/ar_mobile_footer.dart';
import '../shared/mobile/ar_mobile_header.dart';
import '../shared/tablet/ar_tablet_footer.dart';
import '../shared/tablet/ar_tablet_header.dart';
import '../shared/web/ar_web_footer.dart';
import '../shared/web/ar_web_header.dart';
import 'mobile/ar_mobile_home_body.dart';
import 'tablet/ar_tablet_home_body.dart';
import 'web/ar_web_home_body.dart';

class ARHomePage extends StatefulWidget {
  const ARHomePage({super.key});

  @override
  State<ARHomePage> createState() => _ARHomePageState();
}

class _ARHomePageState extends State<ARHomePage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | الرئيسية',
        'الصفحة الرئيسية لسور التكنولوجيا. تصفح واستكشف خدماتنا ذات الجودة الفريدة بما في ذلك تطبيقات البرامج لـ SAP وMicrosoft. اعثر على الأجهزة الأفضل أداءً لمؤسستك من العلامات التجارية الشهيرة مثل Dell، وHP، وCanon، وApple، وغير ذلك الكثير.');
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
                          ? const ARWebHomeBody()
                          : sw < 1280 && sw >= 768
                              ? ARTabletHomeBody(
                                  sw: sw,
                                  sh: sh,
                                  ar: ar,
                                )
                              : ARMobileHomeBody(
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
              ],
            )),
          ),
        ),
      ),
    );
  }
}
