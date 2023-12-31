import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/dev/home/mobile/mobile_dev_home_body.dart';
import 'package:technology_wall/en/dev/home/tablet/tablet_dev_home_body.dart';
import 'package:technology_wall/en/dev/home/web/web_dev_home_body.dart';
import '../../../../core/controllers/metadata_controllers.dart';

class DevHomePage extends StatefulWidget {
  const DevHomePage({super.key});

  @override
  State<DevHomePage> createState() => _DevHomePageState();
}

class _DevHomePageState extends State<DevHomePage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall | Development Center',
        'Develop your custom software or web kits with Technology Wall.',
        'Explore our sample customizations for web development projects. Technology Wall offers a comprehensive and customized services for designing, implementing, and hosting your enterprise online.');
    metadataFunctions.updateMetaData('Technology Wall | Development Center',
        'Develop your custom software or web kits with Technology Wall.');
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
          backgroundColor: const Color(0xaaf0f0f0).withOpacity(1),
          body: ListView(
            controller: scroller,
            physics: const RangeMaintainingScrollPhysics(),
            children: [
              sw >= 1080
                  ? const WebDevHomeBody()
                  : sw < 1080 && sw >= 568
                      ? const TabletDevHomeBody()
                      : const MobileDevHomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
