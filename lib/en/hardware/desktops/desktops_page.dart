import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/en/hardware/desktops/controllers/desktops_controllers.dart';
import 'package:technology_wall/en/hardware/desktops/mobile/mobile_desktops_body.dart';
import 'package:technology_wall/en/hardware/desktops/tablet/tablet_desktops_body.dart';
import 'package:technology_wall/en/hardware/desktops/web/web_desktops_body.dart';
import '../../../config/themes/app_theme.dart';
import '../../../global/controllers/metadata_controllers.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header/web_header.dart';

class DesktopsPage extends StatefulWidget {
  const DesktopsPage({super.key});

  @override
  State<DesktopsPage> createState() => _DesktopsPageState();
}

class _DesktopsPageState extends State<DesktopsPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall Desktops Page',
        'Indispensable desktop computers demanded by every business, serving a wide range of requirements and puroposes.',
        'Offering renowned desktop computers brands: HP, Dell, Lenovo, and iMac. A vast variety of specifications, models, and prices  tailored to suit each and every business need; pushing business progress and innovation forward.');
    metadataFunctions.updateMetaData('Technology Wall | Dekstop Computers',
        'Whether its for graphic design, architecture and AutoCAD utility, or even gaming purposes, you will always find your desired desktop computer here, offered with best prices. Explore Dell Microtower series, Dell OptiPlex series, HP Workstation series, and Lenovo ThinkCentre series.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Find and explore our unqiue collection of dependable and versatile desktop computers, suitable for every use and every individual',
        'en');
  }

  @override
  void dispose() {
    Provider.of<DekstopsControllers>(context, listen: false).desktopsList.clear();
    super.dispose();
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
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                      child: sw >= 1080
                          ? const WebDesktopsBody()
                          : sw < 1080 && sw >= 568
                              ? const TabletDesktopsBody()
                              : const MobileDesktopsBody(),
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
