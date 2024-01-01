import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../config/themes/app_theme.dart';
import '../../../global/controllers/metadata_controllers.dart';
import '../../shared/mobile/ar_mobile_footer.dart';
import '../../shared/mobile/ar_mobile_header.dart';
import '../../shared/tablet/ar_tablet_footer.dart';
import '../../shared/tablet/ar_tablet_header.dart';
import '../../shared/web/ar_web_footer.dart';
import '../../shared/web/ar_web_header.dart';
import 'mobile/ar_mobile_inventory_body.dart';
import 'tablet/ar_tablet_inventory_body.dart';
import 'web/ar_web_inventory_body.dart';

class ARInventoryPage extends StatefulWidget {
  const ARInventoryPage({super.key});

  @override
  State<ARInventoryPage> createState() => _ARInventoryPageState();
}

class _ARInventoryPageState extends State<ARInventoryPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement('سور التكنولوجيا صفحة الأجهزة',
        'تصفح وابحث عن منتجات الأجهزة التي تريدها من موردي أجهزة تكنولوجيا المعلومات المشهورين.', null);
    metadataFunctions.updateMetaData('سور التكنولوجيا | الأجهزة',
        'مجموعة واسعة من الأجهزة والأجهزة الضرورية لدفع أعمالك الرقمية إلى الأمام. تقدم علامات تجارية مثل HP، وDell، وCanon، وCisco، وTP-Link، وغير ذلك الكثير. ابحث عن جميع احتياجاتك من الأجهزة الشخصية أو الخاصة بمؤسستك بناءً على استخداماتك أو الأسعار.');
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
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: sw >= 1080
                            ? const ARWebInventoryBody()
                            : sw < 1080 && sw >= 568
                                ? const ARTabletInventoryBody()
                                : ARMobileInventoryBody(
                                    sw: sw,
                                    sh: sh,
                                    ar: ar,
                                  ),
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
