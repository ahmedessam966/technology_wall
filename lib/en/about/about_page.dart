import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/about/mobile/mobile_about_body.dart';
import 'package:technology_wall/en/about/tablet/tablet_about_body.dart';
import 'package:technology_wall/en/about/web/web_about_body.dart';
import '../shared/web/direct_dependencies_index.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall | About Technology Wall',
        'Discover how Technology Wall was started, Technology Wall success factors, and meet Technology Wall founding and opearational teams.',
        null);
    metadataFunctions.updateMetaData('Technology Wall | About',
        'Since 2000, Technology Wall has made an impact in the IT services field. The founding members, possess extensive technology and IT experience that allow them to pave the way to establishing a successful and impactful entity.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'About Page\n  Discover what drives Technology Wall. Our motivation, vision, and goals. \n The beginning of Technology Wall; how it started. \n Founded by Muhib Marghilani, Technology Wall\'s General Director, and Essameldin Ahmed, Technology Wall\'s Regional MENA Director, the origins of Technology Wall extend back to 2000, which have then transformed to establish a pioneering entity in the field of technology and information systems. Technology Wall has maintained sustainable and feasible expansion strategies that have allowed for the entity\'s growth for the past 23 years, providing unparalleled quality services for more than 50 clients. \n Technology Wall aims to be a major contributor in the digitization initiative in Saudi Arabia. \n In line with the vision of the Kingdom of Saudi Arabia for the year 2030, we aim to contribute in the digital infrastructure development; keeping pace with developments in the field of technology is one of our paramount priorities. Technology Wall thrives to achieve customer satisfaction and providing comprehensive services stemming from our philosophy represented by placing the client in the first place.',
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
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                      child: sw >= 1080
                          ? const WebAboutBody()
                          : sw < 1080 && sw >= 568
                              ? const TabletAboutBody()
                              : const MobileAboutBody(),
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
