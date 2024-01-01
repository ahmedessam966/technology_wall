// bottom_right_popup.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/cookies_manager.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/app_controllers.dart';

class CookiePopup extends StatefulWidget {
  const CookiePopup({super.key});

  @override
  State<CookiePopup> createState() => _CookiePopupState();
}

class _CookiePopupState extends State<CookiePopup> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  final CookiesManager cookies = CookiesManager();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 37.h,
      right: 1.w,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(_slideAnimation),
        child: Container(
            width: 45.w,
            padding: EdgeInsets.all(20.px),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              color: Colors.white70.withOpacity(0.9),
              borderRadius: BorderRadius.circular(5.px),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/cookie.svg',
                  width: 3.w,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'We value your privacy',
                  style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking "Accept Cookies", you consent to our use of cookies.',
                  style: context.bodyLarge,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.px),
                          ),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(AppTheme.darkest),
                      ),
                      onPressed: () {
                        cookies.onAcceptCookies();
                        Provider.of<AppControllers>(context, listen: false).setCookieConsent();
                      },
                      child: Text(
                        'Accept Cookies',
                        style: context.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.px),
                            side: BorderSide(color: AppTheme.darkest.withOpacity(1)),
                          ),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                      ),
                      onPressed: () {
                        Provider.of<AppControllers>(context, listen: false).setCookieDecline();
                      },
                      child: Text(
                        'Reject Cookies',
                        style: context.bodyLarge?.copyWith(color: AppTheme.darkest.withOpacity(1)),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
