import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/themes/app_theme.dart';

class ARTabletFooter extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const ARTabletFooter({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sw * 0.05, vertical: sh * 0.02),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 6,
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo1.png',
                          height: sh * 0.2,
                        ),
                        SizedBox(
                          height: sh * 0.025,
                        ),
                        Text(
                          'Technology Wall Subsidiaries',
                          style: context.bodyLarge?.copyWith(color: Colors.white70),
                        ),
                        SizedBox(
                          height: sh * 0.01,
                        ),
                        Text(
                          'Pro-Rays Co.',
                          style: context.bodyMedium?.copyWith(color: Colors.white54),
                        ),
                        SizedBox(
                          height: sh * 0.01,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white54,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Dubai - United Arab Emirates',
                              overflow: TextOverflow.clip,
                              style: context.bodySmall?.copyWith(color: Colors.white54),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.link,
                              color: Colors.white54,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final Uri uri = Uri(scheme: 'https', path: 'prorays.tech-wall.me');
                                await launchUrl(uri);
                              },
                              child: Text(
                                'prorays.technology-wall.me',
                                style: context.bodySmall?.copyWith(color: Colors.white54),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white54,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '+9722335228',
                              style: context.bodySmall?.copyWith(color: Colors.white54),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.white54,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'info@prorays.tech-wall.me',
                              style: context.bodySmall?.copyWith(color: Colors.white54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: sh * 0.5,
                    child: const VerticalDivider(
                      color: Colors.white70,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 9,
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/software');
                                },
                                child: Text(
                                  'Software',
                                  style: context.bodyLarge?.copyWith(color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                height: sh * 0.01,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/software/sap');
                                },
                                child: Text(
                                  'SAP Solutions',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/software/sage');
                                },
                                child: Text(
                                  'Sage ERP',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/software/tally');
                                },
                                child: Text(
                                  'Tally Solutions',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/software/microsoft');
                                },
                                child: Text(
                                  'Microsoft',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/software/fortinet');
                                },
                                child: Text(
                                  'Fortinet',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              SizedBox(
                                height: sh * 0.04,
                              ),
                              Text(
                                'Contact Us',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              SizedBox(
                                height: sh * 0.01,
                              ),
                              Text(
                                '+966542575808',
                                style: context.bodySmall?.copyWith(color: Colors.white54),
                              ),
                              Text(
                                'info@tech-wall.me',
                                style: context.bodySmall?.copyWith(color: Colors.white54),
                              ),
                              Text(
                                'B233, Olaya District, Riyadh, Saudi Arabia',
                                style: context.bodySmall?.copyWith(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/inventory');
                                },
                                child: Text(
                                  'Hardware',
                                  style: context.bodyLarge?.copyWith(color: Colors.white70),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hardware/cctv');
                                },
                                child: Text(
                                  'CCTVs',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hardware/desktops');
                                },
                                child: Text(
                                  'Desktops',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hardware/firewalls');
                                },
                                child: Text(
                                  'Firewalls',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hardware/notebooks');
                                },
                                child: Text(
                                  'Notebooks',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hardware/printers');
                                },
                                child: Text(
                                  'Printers',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hardware/servers');
                                },
                                child: Text(
                                  'Servers',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Company',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              SizedBox(
                                height: sh * 0.01,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'About Us',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Clients',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Careers',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              SizedBox(
                                height: sh * 0.02,
                              ),
                              Text(
                                'Legal',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              SizedBox(
                                height: sh * 0.01,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Privacy Policy',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Terms of Service',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Security',
                                  style: context.bodySmall?.copyWith(color: Colors.white54),
                                ),
                              ),
                              SizedBox(
                                height: sh * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: AppTheme.darkest.withOpacity(0.5),
              child: Center(
                child: Text(
                  '©️ Developed By Technology Wall Team, Technology Wall Corporation. All Rights Reserved',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
