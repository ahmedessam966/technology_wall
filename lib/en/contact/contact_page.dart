import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/en/contact/mobile/mobile_contact_body.dart';
import 'package:technology_wall/en/contact/tablet/tablet_contact_body.dart';
import 'package:technology_wall/en/contact/web/web_contact_body.dart';
import '../../core/controllers/metadata_controllers.dart';
import '../shared/mobile/mobile_footer.dart';
import '../shared/mobile/mobile_header.dart';
import '../shared/tablet/tablet_footer.dart';
import '../shared/tablet/tablet_header.dart';
import '../shared/web/web_footer.dart';
import '../shared/web/web_header.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | Contact Us',
        'We always value your feedback and opinions. You can contact us via the contact information listed here, or by filling the contact form and we\'ll reach out to you!. You can also check the frequently asked questions section of this page to get assistance faster.');
    metadataFunctions.updateHeaderMetaData();
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
        enableKeyboardScrolling: false,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppTheme.darkest,
            onPressed: () {},
            child: const Icon(
              Icons.chat_rounded,
              color: Colors.white70,
            ),
          ),
          body: ListView(
            controller: scroller,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw <= 768 ? 3.w : 80, vertical: 3.h),
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
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                child: sw >= 1280
                    ? const WebContactBody()
                    : sw < 1280 && sw >= 768
                        ? const TabletContactBody()
                        : const MobileContactBody(),
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
    );
  }
}
