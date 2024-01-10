// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/en/shared/web/web_login_type_selector.dart';
import 'package:technology_wall/global/controllers/app_controllers.dart';
import '../../../ar/shared/language_redirect.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../global/controllers/auth_controllers.dart';
import 'dart:html' as html;

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppControllers>(
      builder: (context, app, _) {
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
                          } else if (app.pageTitle.endsWith('Home')) {
                            return LinearBorder.bottom(
                              size: 0.5,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const LinearBorder(
                              side: BorderSide(color: Colors.transparent),
                            );
                          }
                        }),
                      ),
                      onPressed: () {
                        app.pageTitle.endsWith('Home') ? null : Navigator.pushNamed(context, '/en');
                      },
                      child: Text('Home', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
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
                          } else if (app.pageTitle.endsWith('Hardware')) {
                            return LinearBorder.bottom(
                              size: 0.5,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const LinearBorder(
                              side: BorderSide(color: Colors.transparent),
                            );
                          }
                        }),
                      ),
                      onPressed: () {
                        app.pageTitle.endsWith('Hardware')
                            ? null
                            : Navigator.pushNamed(context, '/en/hardware');
                      },
                      child: Text('Hardware', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
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
                          } else if (app.pageTitle.endsWith('Software')) {
                            return LinearBorder.bottom(
                              size: 0.5,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const LinearBorder(
                              side: BorderSide(color: Colors.transparent),
                            );
                          }
                        }),
                      ),
                      onPressed: () {
                        app.pageTitle.endsWith('Software')
                            ? null
                            : Navigator.pushNamed(context, '/en/software');
                      },
                      child: Text('Software', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
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
                          } else if (app.pageTitle.endsWith('SAP')) {
                            return LinearBorder.bottom(
                              size: 0.5,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const LinearBorder(
                              side: BorderSide(color: Colors.transparent),
                            );
                          }
                        }),
                      ),
                      onPressed: () {
                        app.pageTitle.endsWith('SAP')
                            ? null
                            : Navigator.pushNamed(context, '/en/software/sap');
                      },
                      child: Text('SAP Solutions', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
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
                          } else if (app.pageTitle.endsWith('About') ||
                              app.pageTitle.endsWith('Accreditation')) {
                            return LinearBorder.bottom(
                              size: 0.5,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const LinearBorder(
                              side: BorderSide(color: Colors.transparent),
                            );
                          }
                        }),
                      ),
                      onPressed: () {
                        app.pageTitle.endsWith('About') ? null : Navigator.pushNamed(context, '/en/about');
                      },
                      child: Text('About TW', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
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
                          } else if (app.pageTitle.endsWith('Contact Us')) {
                            return LinearBorder.bottom(
                              size: 0.5,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const LinearBorder(
                              side: BorderSide(color: Colors.transparent),
                            );
                          }
                        }),
                      ),
                      onPressed: () {
                        app.pageTitle.endsWith('Contact Us')
                            ? null
                            : Navigator.pushNamed(context, '/en/contact-us');
                      },
                      child: Text('Contact Us', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
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
                      onPressed: () {
                        app.pageTitle.endsWith('Development Center')
                            ? null
                            : Navigator.pushNamed(context, '/dev');
                      },
                      child: Text('Dev Center', style: context.bodyLarge?.copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              IconButton(
                padding: EdgeInsets.all(10.px),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(const Color(0xaaf1f1f1).withOpacity(1)),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.px)))),
                onPressed: () async {
                  await showAdaptiveDialog(
                      context: context,
                      builder: (ctx) {
                        return const WebLoginTypeSelector();
                      });
                },
                icon: Builder(builder: (ctx) {
                  final String? name =
                      Provider.of<AuthControllers>(context, listen: true).userModel?.name.split(' ')[0];
                  return Row(
                    children: [
                      Text(name ?? 'Sign In', style: context.bodyLarge?.copyWith(color: Colors.black)),
                      name == null ? const Icon(Icons.arrow_right_alt_outlined) : const SizedBox.shrink(),
                    ],
                  );
                }),
              ),
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
