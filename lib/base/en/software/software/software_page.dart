import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/base/en/software/software/mobile/mobile_software_body.dart';
import 'package:technology_wall/base/en/software/software/tablet/tablet_software_body.dart';
import 'package:technology_wall/base/en/software/software/web/web_software_body.dart';
import '../../../../config/themes/app_theme.dart';
import '../../../../core/controllers/metadata_controllers.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header.dart';

class SoftwarePage extends StatefulWidget {
  const SoftwarePage({super.key});

  @override
  State<SoftwarePage> createState() => _SoftwarePageState();
}

class _SoftwarePageState extends State<SoftwarePage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | Software',
        'Boost your enterprise perfomance with fundamental software products with competitive pricing ranges, only at Technology Wall. You can explore Microsoft, Fortinet, SAP, Sage, Tally, Zoho products, and much more.');
    metadataFunctions.updateHeaderMetaData();
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
                      padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 3.w : 6.w, vertical: 2.h),
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
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                      child: sw >= 1280
                          ? const WebSoftwareBody()
                          : sw < 1280 && sw >= 768
                              ? const TabletSoftwareBody()
                              : const MobileSoftwareBody(),
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
              ],
            )),
      ),
    );
  }
}
