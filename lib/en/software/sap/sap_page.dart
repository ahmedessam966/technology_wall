import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header.dart';
import 'web/web_sap_body.dart';
import '../../shared/web/direct_dependencies_index.dart';

class SAPPage extends StatefulWidget {
  const SAPPage({super.key});

  @override
  State<SAPPage> createState() => _SAPPageState();
}

class _SAPPageState extends State<SAPPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | SAP',
        'Explore the realm of SAP Enterprise Resource Planning solutions, services, and products. Get to know the aspects that makes SAP stand out among the top-tier ERP solutions in the world.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'SAP Business One Solutions: ERP system that is specialized and tailored for small to medium-sized enterprises. Providing unparalleled modules and solutions including, Cloud ERP, Business Technology Plarform, Artificial Intelligence, Supply Chain Management, Financial Management, and much more.\n\n\n Get your certified SAP solutions with Technology Wall.',
        'en');
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
                      padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 30 : 80, vertical: 20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                      child: sw >= 1280
                          ? const WebSAPBody()
                          : sw < 1280 && sw >= 768
                              ? const SizedBox()
                              : const SizedBox(),
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
