// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/app_controllers.dart';
import '../../../../ar/shared/language_redirect.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../global/controllers/auth_controllers.dart';
import 'dart:html' as html;
import 'components/sign_button.dart';
part 'components/nav_bar_button.g.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppControllers, AuthControllers>(
      builder: (context, app, auth, _) {
        return SizedBox(
          height: 15.h,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, '/en');
                    },
                    child: Image.asset(
                      'assets/images/logo1.webp',
                      height: 12.h,
                    ),
                  ),
                  Text(
                    'Powered By HCC',
                    style: context.bodyMedium?.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 35.h,
                padding: EdgeInsets.all(20.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavBarButton(
                      app: app,
                      title: 'Home',
                      action: () {
                        app.pageTitle.endsWith('Home') ? null : Navigator.pushNamed(context, '/en');
                      },
                    ),
                    NavBarButton(
                      app: app,
                      title: 'Hardware',
                      action: () {
                        app.pageTitle.endsWith('Hardware')
                            ? null
                            : Navigator.pushNamed(context, '/en/hardware');
                      },
                    ),
                    NavBarButton(
                      app: app,
                      title: 'Software',
                      action: () {
                        app.pageTitle.endsWith('Software')
                            ? null
                            : Navigator.pushNamed(context, '/en/software');
                      },
                    ),
                    NavBarButton(
                      app: app,
                      title: 'SAP',
                      action: () {
                        app.pageTitle.endsWith('SAP')
                            ? null
                            : Navigator.pushNamed(context, '/en/software/sap');
                      },
                    ),
                    NavBarButton(
                      app: app,
                      title: 'About',
                      action: () {
                        app.pageTitle.endsWith('About') || app.pageTitle.endsWith('Accreditation')
                            ? null
                            : Navigator.pushNamed(context, '/en/about');
                      },
                    ),
                    NavBarButton(
                      app: app,
                      title: 'Contact Us',
                      action: () {
                        app.pageTitle.endsWith('Contact Us')
                            ? null
                            : Navigator.pushNamed(context, '/en/contact-us');
                      },
                    ),
                    NavBarButton(
                      title: 'Development Center',
                      app: app,
                      action: () {
                        app.pageTitle.endsWith('Development Center')
                            ? null
                            : Navigator.pushNamed(context, '/dev');
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Builder(builder: (ctx) {
                if (auth.userModel?.id != null) {
                  return DropdownMenu(
                    width: 13.w,
                    enableSearch: false,
                    requestFocusOnTap: false,
                    inputDecorationTheme: InputDecorationTheme(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      floatingLabelStyle: context.bodyMedium?.copyWith(color: Colors.white70),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    label: Text(
                      'My Account',
                      style: context.bodyMedium?.copyWith(color: Colors.white70),
                    ),
                    leadingIcon: const Icon(
                      CupertinoIcons.person_crop_circle,
                      color: Colors.white70,
                    ),
                    trailingIcon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
                    selectedTrailingIcon: const Icon(Icons.arrow_drop_up, color: Colors.white70),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                        value: 'Account',
                        label: 'My Account',
                        leadingIcon: Icon(
                          CupertinoIcons.person_alt,
                        ),
                      ),
                      DropdownMenuEntry(
                        value: 'Dark Mode',
                        label: 'Dark Mode',
                        leadingIcon: Icon(
                          CupertinoIcons.moon_fill,
                        ),
                      ),
                      DropdownMenuEntry(
                        value: 'Log Out',
                        label: 'Log Out',
                        leadingIcon: Icon(
                          CupertinoIcons.power,
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      if (value != null) {
                        if (value == 'Account') {
                          Navigator.pushNamed(context, '/en/#/account');
                        } else if (value == 'Dark Mode') {
                        } else {
                          auth.logOut();
                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.pushNamedAndRemoveUntil(context, '/en', (route) => false);
                          });
                        }
                      }
                    },
                  );
                } else {
                  return SignInButton(
                    auth: auth,
                  );
                }
              }),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.white10;
                    } else {
                      return null;
                    }
                  }),
                  shape: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return LinearBorder.bottom(
                        side: const BorderSide(color: Colors.white54),
                      );
                    } else {
                      return const LinearBorder(
                        side: BorderSide(color: Colors.transparent),
                      );
                    }
                  }),
                ),
                onPressed: () async {
                  String current = html.window.location.href;
                  int indexOfEn = current.indexOf("/en/");
                  String destination = current.substring(indexOfEn + 4);
                  app.changeLocale(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageRedirect(
                        url: destination,
                      ),
                    ),
                  );
                },
                child: Text('العربية', style: context.titleSmall?.copyWith(color: Colors.white70)),
              ),
              const Spacer()
            ],
          ),
        );
      },
    );
  }
}
