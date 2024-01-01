import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../config/themes/app_theme.dart';
import '../../../core/controllers/inventory_controllers.dart';
import '../../../core/controllers/metadata_controllers.dart';
import '../../shared/mobile/ar_mobile_footer.dart';
import '../../shared/mobile/ar_mobile_header.dart';
import '../../shared/tablet/ar_tablet_footer.dart';
import '../../shared/tablet/ar_tablet_header.dart';
import '../../shared/web/ar_web_footer.dart';
import '../../shared/web/ar_web_header.dart';
import 'mobile/ar_mobile_desktops_body.dart';
import 'tablet/ar_tablet_desktops_body.dart';
import 'web/ar_web_desktops_body.dart';

class ARDesktopsPage extends StatefulWidget {
  const ARDesktopsPage({super.key});

  @override
  State<ARDesktopsPage> createState() => _ARDesktopsPageState();
}

class _ARDesktopsPageState extends State<ARDesktopsPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'سور التكنولوجيا صفحة الحواسب المكتبية',
        'أجهزة الكمبيوتر المكتبية التي لا غنى عنها والتي تطلبها كل الشركات، تخدم نطاقًا واسعًا من المتطلبات والأغراض.',
        'تقدم العلامات التجارية الشهيرة لأجهزة الكمبيوتر المكتبية: HP، وDell، وLenovo، وiMac. مجموعة كبيرة ومتنوعة من المواصفات والموديلات والأسعار المصممة لتناسب كل احتياجات العمل؛ دفع تقدم الأعمال والابتكار إلى الأمام.');
    metadataFunctions.updateMetaData('سور التكنولوجيا | الحواسب المكتبية',
        'سواء أكان ذلك مخصصًا للتصميم الرسومات أو الهندسة المعمارية أو أداة AutoCAD أو حتى لأغراض الألعاب، فستجد دائمًا الكمبيوتر المكتبي الذي تريده هنا، وبأفضل الأسعار. استكشف سلسلة Dell Microtower، وسلسلة Dell OptiPlex، وسلسلة HP Workstation، وسلسلة Lenovo ThinkCentre.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  void dispose() {
    Provider.of<InventoryControllers>(context, listen: false).notebooksList.clear();
    super.dispose();
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
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                        child: sw >= 1080
                            ? const ARWebDesktopsBody()
                            : sw < 1080 && sw >= 568
                                ? const ARTabletDesktopsBody()
                                : const ARMobileDesktopsBody(),
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
