import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/ar/about/mobile/ar_mobile_about_body.dart';
import 'package:technology_wall/ar/about/tablet/ar_tablet_about_body.dart';
import 'package:technology_wall/ar/about/web/ar_web_about_body.dart';
import '../../global/controllers/metadata_controllers.dart';
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
    metadataFunctions.updateHElement(
        'سور التكنولوجيا | عن الشركة ',
        'اكتشف كيف بدأت سور التكنولوجيا، وعوامل نجاح سور التكنولوجيا، وتعرف على الفرق المؤسسة والتشغيلية لسور التكنولوجيا.',
        null);
    metadataFunctions.updateMetaData('سور التكنولوجيا | عن الشركة ',
        'منذ عام 2000، أحدث سور التكنولوجيا تأثيرًا في مجال خدمات تكنولوجيا المعلومات. يمتلك الأعضاء المؤسسون خبرة واسعة في مجال التكنولوجيا وتكنولوجيا المعلومات التي سمحت لهم بتمهيد الطريق لإنشاء كيان ناجح ومؤثر.');
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
                    padding: EdgeInsets.symmetric(horizontal: sw <= 568 ? 3.w : 6.w, vertical: 2.h),
                    child: sw >= 1080
                        ? const ARWebHeader()
                        : sw < 1080 && sw >= 568
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
                    child: sw >= 1080
                        ? const ARWebAboutBody()
                        : sw < 1080 && sw >= 568
                            ? const ARTabletAboutBody()
                            : const ARMobileAboutBody(),
                  ),
                  sw >= 1080
                      ? const ARWebFooter()
                      : sw < 1080 && sw >= 568
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
    );
  }
}
