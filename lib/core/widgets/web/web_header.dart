import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import '../../controllers/auth_controllers.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      container: true,
      button: true,
      readOnly: true,
      label: 'Technology Wall, Tech-Wall, tech-wall.me',
      value:
          'Computers, Laptops, Computer Hardware, Computer Software, ERP, SAP, SAP Business One, SAP 4/Hana, S4/Hana, Zoho, Zoho ERP, Sage, Sage Software, Sage ERP, Networking, Contact Us, About, ',
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    final app = Provider.of<AppControllers>(context, listen: false);
                    // Navigator.pushNamed(context, '/');
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(const Locale('ar', 'SA'));
                      app.changeLocale(false);
                    } else {
                      context.setLocale(const Locale('en', 'US'));
                      app.changeLocale(true);
                    }
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
                  style: context.bodySmall?.copyWith(
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/hardware');
                    },
                    child: Text(
                      context.tr('hardware'),
                      style: context.locale.languageCode == 'en'
                          ? context.bodyLarge?.copyWith(color: Colors.white)
                          : context.displayLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/software');
                    },
                    child: Text(
                      context.tr('software'),
                      style: context.locale.languageCode == 'en'
                          ? context.bodyLarge?.copyWith(color: Colors.white)
                          : context.displayLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/software/sap');
                    },
                    child: Text(
                      context.tr('sap_solutions'),
                      style: context.locale.languageCode == 'en'
                          ? context.bodyLarge?.copyWith(color: Colors.white)
                          : context.displayLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      context.tr('services'),
                      style: context.locale.languageCode == 'en'
                          ? context.bodyLarge?.copyWith(color: Colors.white)
                          : context.displayLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      context.tr('about_tw'),
                      style: context.locale.languageCode == 'en'
                          ? context.bodyLarge?.copyWith(color: Colors.white)
                          : context.displayLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contact-us');
                    },
                    child: Text(
                      context.tr('contact_us'),
                      style: context.locale.languageCode == 'en'
                          ? context.bodyLarge?.copyWith(color: Colors.white)
                          : context.displayLarge?.copyWith(color: Colors.white),
                    ),
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
                tooltip: 'zoho_portal_tooltip'.tr(),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(const Color(0xaaf1f1f1).withOpacity(1)),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.pushNamed(context, '/portal');
                },
                icon: Row(
                  children: [
                    Builder(builder: (context) {
                      final String? name =
                          Provider.of<AuthControllers>(context, listen: false).staffModel?.name.split('')[0];
                      return Text(
                        name ?? 'sign_in'.tr(),
                        style: context.locale.languageCode == 'en'
                            ? context.bodyLarge?.copyWith(color: Colors.black)
                            : context.displayLarge?.copyWith(color: Colors.black),
                      );
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
          ],
        ),
      ),
    );
  }
}
