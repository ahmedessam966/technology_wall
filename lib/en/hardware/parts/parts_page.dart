import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/hardware/parts/mobile/mobile_parts_body.dart';
import 'package:technology_wall/en/hardware/parts/tablet/tablet_parts_body.dart';
import 'package:technology_wall/en/hardware/parts/web/web_parts_body.dart';
import '../../shared/web/direct_dependencies_index.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({super.key});

  @override
  State<PartsPage> createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall Spare Parts Page',
        'Indispensable desktop computers demanded by every business, serving a wide range of requirements and puroposes.',
        'Offering renowned desktop computers brands: HP, Dell, Lenovo, and iMac. A vast variety of specifications, models, and prices  tailored to suit each and every business need; pushing business progress and innovation forward.');
    metadataFunctions.updateMetaData('Technology Wall | Dekstop Computers',
        'Whether its for graphic design, architecture and AutoCAD utility, or even gaming purposes, you will always find your desired desktop computer here, offered with best prices. Explore Dell Microtower series, Dell OptiPlex series, HP Workstation series, and Lenovo ThinkCentre series.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent('', 'en');
  }

  @override
  void dispose() {
    // Provider.of<InventoryControllers>(context, listen: false).notebooksList.clear();
    super.dispose();
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
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                      child: sw >= 1080
                          ? const WebPartsBody()
                          : sw < 1080 && sw >= 568
                              ? const TabletPartsBody()
                              : const MobilePartsBody(),
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
