import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import '../../global/controllers/metadata_controllers.dart';
import '../shared/mobile/ar_mobile_footer.dart';
import '../shared/mobile/ar_mobile_header.dart';
import '../shared/tablet/ar_tablet_footer.dart';
import '../shared/tablet/ar_tablet_header.dart';
import '../shared/web/ar_web_footer.dart';
import '../shared/web/ar_web_header.dart';
import 'mobile/ar_mobile_contact_body.dart';
import 'tablet/ar_tablet_contact_body.dart';
import 'web/ar_web_contact_body.dart';

class ARContactPage extends StatefulWidget {
  const ARContactPage({super.key});

  @override
  State<ARContactPage> createState() => _ARContactPageState();
}

class _ARContactPageState extends State<ARContactPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'صفحة الاتصال بسور التكنولوجيا',
        'اتصل بـ سور التكنولوجيا عبر البريد الإلكتروني أو رقم الهاتف الموجود في هذه الصفحة.',
        'البريد الألكتروني: info@techwall.com.sa | الهاتف: +966542575808');
    metadataFunctions.updateMetaData('سور التكنولوجيا | اتصل بنا',
        'نحن نقدر دائما ملاحظاتك وآرائك. يمكنك الاتصال بنا عبر معلومات الاتصال المذكورة هنا، أو عن طريق ملء نموذج الاتصال وسنتواصل معك! يمكنك أيضًا مراجعة قسم الأسئلة الشائعة في هذه الصفحة للحصول على المساعدة بشكل أسرع.');
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
          enableKeyboardScrolling: false,
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
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                        child: sw >= 1080
                            ? const ARWebContactBody()
                            : sw < 1080 && sw >= 568
                                ? const ARTabletContactBody()
                                : const ARMobileContactBody(),
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
