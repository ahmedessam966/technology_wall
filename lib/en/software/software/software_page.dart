import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/software/software/mobile/mobile_software_body.dart';
import 'package:technology_wall/en/software/software/tablet/tablet_software_body.dart';
import 'package:technology_wall/en/software/software/web/web_software_body.dart';
import '../../shared/web/direct_dependencies_index.dart';

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
    metadataFunctions.updateHElement(
        'Technology Wall Software Page',
        'All necessary software products for personal leisure or enterprise performance. Explore our exclusive, powered by HCC, SAP ERP solutions.',
        'Best offers on Microsoft, Sage, Zoho, Tally, and Fortinet software products.');
    metadataFunctions.updateMetaData('Technology Wall | Software',
        'Boost your enterprise perfomance with fundamental software products with competitive pricing ranges, only at Technology Wall. You can explore Microsoft, Fortinet, SAP, Sage, Tally, Zoho products, and much more.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Find your desired personal or enterprise level software here. All licensed and maintainable. Available software essentials include Microsof Office, Microsoft 365, Microsoft Windows 11, Microsoft Windows 10, SAP Business One ERP Solution, Tally ERP Solution, Sage ERP, Zoho ERP Solutions, Fortinet Security Software, and much more.',
        'en');
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
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
                              ? const TabletHeader()
                              : const MobileHeader(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: sw >= 1080
                          ? const WebSoftwareBody()
                          : sw < 1080 && sw >= 568
                              ? const TabletSoftwareBody()
                              : const MobileSoftwareBody(),
                    ),
                    sw >= 1080
                        ? const WebFooter()
                        : sw < 1080 && sw >= 568
                            ? const TabletFooter()
                            : const MobileFooter(),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
