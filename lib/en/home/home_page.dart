import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'mobile/mobile_home_body.dart';
import 'tablet/tablet_home_body.dart';
import 'web/web_home_body.dart';
import '../shared/web/direct_dependencies_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall Home Page',
        'Browse and explore our unique-quality services including software implementations for SAP and Microsoft. Find the best-performing hardware devices for your enteprise from renowned brands; Dell, HP, Canon, Apple, and much more.',
        null);
    metadataFunctions.updateMetaData('Technology Wall | Home',
        'Browse and explore our unique-quality services including software implementations for SAP and Microsoft. Find the best-performing hardware devices for your enteprise from renowned brands; Dell, HP, Canon, Apple, and much more.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Offers and Featured Products \n Enterprise Essentials\n ERP Essentials \n Powered by HCC, a certified SAP Solutions Partner, Technology Wall offers unique SAP Solutions for any business. Offering feasible and professional projection forecasts, determining the required scale of the ERP solution, implmentation and system deployments through client-customized CI/CD operations, and an optional annual maintenance contract carried out by our expert certified SAP Consultants. \n Technology Wall is directly licensed by Sage ERP System Corporation to propose, design, and implement Sage ERP Solutions. Having a dedicated team of Sage Solutions experts, Technology Wall also offers a competitive post-sales support plan for implemented Sage Solutions - 24/7. \n Technology Wall aims to fully and professionally serve the business logic requirements of enterprises of all scales - small, medium, and expansive. To serve such purpose, Technology Wall offers its services for Tally Solutions as a certified distributor.',
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
                        ? const WebHomeBody()
                        : sw < 1080 && sw >= 568
                            ? const TabletHomeBody()
                            : const MobileHomeBody(),
                  ),
                  sw >= 1080
                      ? const WebFooter()
                      : sw < 1080 && sw >= 568
                          ? const TabletFooter()
                          : const MobileFooter(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
