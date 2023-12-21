import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import '../../shared/mobile/ar_mobile_footer.dart';
import '../../shared/mobile/ar_mobile_header.dart';
import '../../shared/tablet/ar_tablet_footer.dart';
import '../../shared/tablet/ar_tablet_header.dart';
import '../../shared/web/ar_web_footer.dart';
import '../../shared/web/ar_web_header.dart';
import 'web/ar_web_notebooks_body.dart';

class ARNotebooksPage extends StatefulWidget {
  const ARNotebooksPage({super.key});

  @override
  State<ARNotebooksPage> createState() => _ARNotebooksPageState();
}

class _ARNotebooksPageState extends State<ARNotebooksPage> {
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    final double ar = MediaQuery.of(context).size.aspectRatio;
    final scroller = ScrollController();

    return Semantics(
      link: true,
      label: 'Technology Wall | Notebooks',
      value:
          'HP, Dell, Lenovo, MacBook, Apple, Acer, Asus, Toshiba, HP Notebooks, HP Laptops, Dell Notebooks, Dell Laptops, Lenovo Laptops, Lenovo Notebooks, MacBook Pro, MacBook Notebooks, MacBook Laptops, MacBook Pro Laptops, MacBook Pro Notebooks, Apple Laptops, Apple Notebooks, Acer Laptops, Acer Notebooks, Asus Laptops, Asus Notebooks, Toshiba Laptops, Toshiba Notebooks',
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
                      ? const ARWebNotebooksBody()
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
    );
  }
}
