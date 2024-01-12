import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/en/hardware/printers/controllers/printers_controllers.dart';
import 'package:technology_wall/en/hardware/printers/mobile/mobile_printers_body.dart';
import '../../../config/themes/app_theme.dart';
import '../../../global/controllers/metadata_controllers.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header/web_header.dart';
import 'web/web_printers_body.dart';

class PrintersPage extends StatefulWidget {
  final String? category;
  const PrintersPage({super.key, this.category});

  @override
  State<PrintersPage> createState() => _PrintersPageState();
}

class _PrintersPageState extends State<PrintersPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall | Printers',
        'A colloection of daily utility personal and enterprise-level printers.',
        'You can explore, search, and find renowned brands such as HP, Canon, Fujitsu, and Ricoh.');
    metadataFunctions.updateMetaData('Technology Wall | Printers',
        'All printing purposes available. Available types: color laserjet, monochrome laserjet, dot-matrix, heavy-duty office printer, all-in-one printers. Available brands: HP, Canon, Zebra, and Epson');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Explore or search for your desired printer. Explore the types of printers available: Color laserjet, dot-matrix, monochrome laserjet, deskjet, heavy-duty office utility, network printers, and all-in-one printer models. Guaranteed brands; HP, Canon, Epson, and Zebra printers.',
        'en');
  }

  @override
  void dispose() {
    Provider.of<PrintersControllers>(context, listen: false).printersList.clear();
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
                        ? const WebPrintersBody()
                        : sw < 1080 && sw >= 568
                            ? const SizedBox()
                            : const MobilePrintersBody(),
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
          ),
        ),
      ),
    );
  }
}
