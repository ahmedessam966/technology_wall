import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/contact/mobile/mobile_contact_body.dart';
import 'package:technology_wall/en/contact/tablet/tablet_contact_body.dart';
import 'package:technology_wall/en/contact/web/web_contact_body.dart';
import '../shared/web/direct_dependencies_index.dart';

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
    metadataFunctions.updateHElement(
        'Technology Wall Contact Page',
        'Contact Technology Wall via the email or the phone number in this page.',
        'email: info@techwall.com.sa | Phone: +966542575808');
    metadataFunctions.updateMetaData('Technology Wall | Contact Us',
        'We always value your feedback and opinions. You can contact us via the contact information listed here, or by filling the contact form and we\'ll reach out to you!. You can also check the frequently asked questions section of this page to get assistance faster.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Contact Email Address: info@techwall.com.sa - Contact Phone Number: +966542575808 - Facebook Page: https://facebook.com/techwall.sa - Address: Office 27, Building 233, Jarir Street, Olaya Computer Market, 12211 Riyadh, Saudi Arabia',
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
        enableKeyboardScrolling: false,
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
                          ? const WebContactBody()
                          : sw < 1080 && sw >= 568
                              ? const TabletContactBody()
                              : const MobileContactBody(),
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
