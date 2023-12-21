import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import '../../shared/mobile/mobile_footer.dart';
import '../../shared/mobile/mobile_header.dart';
import '../../shared/tablet/tablet_footer.dart';
import '../../shared/tablet/tablet_header.dart';
import '../../shared/web/web_footer.dart';
import '../../shared/web/web_header.dart';
import 'web/web_notebooks_body.dart';

class NotebooksPage extends StatefulWidget {
  const NotebooksPage({super.key});

  @override
  State<NotebooksPage> createState() => _NotebooksPageState();
}

class _NotebooksPageState extends State<NotebooksPage> {
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
                      ? const WebHeader()
                      : sw < 1280 && sw >= 768
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
                  child: sw >= 1280
                      ? const WebNotebooksBody()
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
          ),
        ),
      ),
    );
  }
}
