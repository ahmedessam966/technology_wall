import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/dev/en/home/mobile/mobile_dev_home_body.dart';
import 'package:technology_wall/dev/en/home/tablet/tablet_dev_home_body.dart';
import 'package:technology_wall/dev/en/home/web/web_dev_home_body.dart';
import '../../../core/controllers/metadata_controllers.dart';

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
    metadataFunctions.updateMetaData('Technology Wall | Development Center',
        'Develop your custom software or web kits with Technology Wall.');
    metadataFunctions.updateHeaderMetaData();
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
          backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
          appBar: AppBar(
            backgroundColor: const Color(0xaa0025ce).withOpacity(1),
            leading: BackButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/en', (route) => false);
              },
              color: Colors.white,
            ),
            centerTitle: true,
            title: Text(
              'Technology Wall Digital Development Center',
              style: context.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          body: ListView(
            controller: scroller,
            physics: const RangeMaintainingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.1.h),
                child: sw >= 1280
                    ? const WebDevHomeBody()
                    : sw < 1280 && sw >= 768
                        ? const TabletDevHomeBody()
                        : const MobileDevHomeBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
