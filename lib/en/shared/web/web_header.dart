import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import '../language_redirect.dart';

import '../../../core/controllers/auth_controllers.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      container: true,
      button: true,
      readOnly: true,
      label: 'Technology Wall, Tech-Wall, tech-wall.me, techwall.com.sa',
      value:
          'Computers, Laptops, Computer Hardware, Computer Software, ERP, SAP, SAP Business One, SAP 4/Hana, S4/Hana, Zoho, Zoho ERP, Sage, Sage Software, Sage ERP, Networking, Contact Us, About, ',
      child: Consumer<AppControllers>(
        builder: (context, app, _) {
          return SizedBox(
            height: 120,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/en');
                      },
                      child: Semantics(
                        label: 'Main Logo',
                        image: true,
                        link: true,
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 90,
                        ),
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
                  height: 300,
                  padding: const EdgeInsets.all(20),
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
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Semantics(
                  button: true,
                  label: 'Zoho Customer Portal Login Button',
                  child: IconButton(
                    padding: const EdgeInsets.all(10),
                    tooltip: 'Zoho Customer Portal',
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(const Color(0xaaf1f1f1).withOpacity(1)),
                        elevation: const MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/en/portal');
                    },
                    icon: Row(
                      children: [
                        Builder(builder: (context) {
                          final String? name = Provider.of<AuthControllers>(context, listen: false)
                              .staffModel
                              ?.name
                              .split('')[0];
                          return Text(name ?? 'Sign In',
                              style: context.bodyLarge?.copyWith(color: Colors.black));
                        }),
                        const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
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
                    app.changeLocale(false);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const LanguageRedirect()));
                  },
                  child: Text('العربية', style: context.titleSmall?.copyWith(color: Colors.white70)),
                ),
                const Spacer()
              ],
            ),
          );
        },
      ),
    );
  }
}
