import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/home/mobile/mobile_home_body.dart';
import 'package:technology_wall/home/tablet/tablet_home_body.dart';
import 'package:technology_wall/home/web/web_home_body.dart';

import '../core/controllers/app_controllers.dart';
import '../core/widgets/mobile/mobile_footer.dart';
import '../core/widgets/mobile/mobile_header.dart';
import '../core/widgets/non_web_drawer.dart';
import '../core/widgets/tablet/tablet_footer.dart';
import '../core/widgets/tablet/tablet_header.dart';
import '../core/widgets/web/web_footer.dart';
import '../core/widgets/web/web_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();
    final provider = Provider.of<AppControllers>(context, listen: true);
    return PopScope(
      canPop: true,
      child: ImprovedScrolling(
        scrollController: scroller,
        enableMMBScrolling: true,
        enableKeyboardScrolling: true,
        child: Scaffold(
          key: sw < 1440 ? provider.nonWebScaffoldKey : null,
          drawer: sw < 1440 ? NonWebDrawer(width: sw) : null,
          body: ListView(
            controller: scroller,
            physics: const RangeMaintainingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 40 : 80, vertical: 20),
                child: sw >= 1440
                    ? const WebHeader()
                    : sw < 1440 && sw >= 768
                        ? TabletHeader(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          )
                        : MobileHeader(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: sw >= 1440
                    ? const WebHomeBody()
                    : sw < 1440 && sw >= 768
                        ? TabletHomeBody(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          )
                        : MobileHomeBody(
                            sw: sw,
                            sh: sh,
                            ar: ar,
                          ),
              ),
              sw >= 1440
                  ? const WebFooter()
                  : sw < 1440 && sw >= 768
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
        ),
      ),
    );
  }
}
