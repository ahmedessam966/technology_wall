import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:technology_wall/en/account/mobile/mobile_account_page_body.dart';
import 'package:technology_wall/en/account/tablet/tablet_account_page_body.dart';
import 'package:technology_wall/en/account/web/web_account_page_body.dart';
import '../shared/web/direct_dependencies_index.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

bool _fetching = true;

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _fetching = false;
      });
    });
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
          backgroundColor: Colors.white70,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppTheme.darkest,
            onPressed: () {},
            child: const Icon(
              Icons.chat_rounded,
              color: Colors.white70,
            ),
          ),
          body: _fetching
              ? Center(
                  child: SpinKitCircle(
                    size: 50.px,
                    color: AppTheme.third.withOpacity(1),
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      color: AppTheme.darkest.withOpacity(1),
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
                              ? const WebAccountPageBody()
                              : sw < 1080 && sw >= 568
                                  ? const TabletAccountPageBody()
                                  : const MobileAccountPageBody(),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
