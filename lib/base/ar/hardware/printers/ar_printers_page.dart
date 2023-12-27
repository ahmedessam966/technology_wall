import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../../../../core/controllers/metadata_controllers.dart';
import '../../shared/mobile/ar_mobile_footer.dart';
import '../../shared/mobile/ar_mobile_header.dart';
import '../../shared/tablet/ar_tablet_footer.dart';
import '../../shared/tablet/ar_tablet_header.dart';
import '../../shared/web/ar_web_footer.dart';
import '../../shared/web/ar_web_header.dart';
import 'web/ar_printers_web_body.dart';

class ARPrintersPage extends StatefulWidget {
  final String? category;
  const ARPrintersPage({super.key, this.category});

  @override
  State<ARPrintersPage> createState() => _ARPrintersPageState();
}

class _ARPrintersPageState extends State<ARPrintersPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();

  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | طابعات',
        'استكشف أو ابحث عن الطابعة التي تريدها. استكشف أنواع الطابعات المتوفرة: طابعة ليزر ملونة، وطابعة نقطية، وطابعة أحادية اللون، وطابعة مكتبية، وأدوات مكتبية للخدمة الشاقة، وطابعات الشبكة، ونماذج الطابعات المتكاملة. العلامات التجارية المضمونة. طابعات HP وCanon وEpson وZebra.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  void dispose() {
    Provider.of<InventoryControllers>(context, listen: false).printersList.clear();
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
      child: Semantics(
        link: true,
        label: 'Technology Wall | Printers',
        value:
            'HP Printers, Canon Printers, Epson Printers, Zebra Printers, Printers, Scanners, Copier, Scanner, HP All-In-One, Canon All-In-One, Epson Dot Matrix, Dot Matrix, HP Scanners, HP Copier, Epson Scanners, Network Printers, HP Network Printer',
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
              body: ListView(
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
                        ? const ARWebHardwareBody()
                        : sw < 1280 && sw >= 768
                            ? const SizedBox()
                            : const SizedBox(),
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
            ),
          ),
        ),
      ),
    );
  }
}
