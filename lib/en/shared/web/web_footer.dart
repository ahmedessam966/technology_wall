import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 9,
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo1.png',
                          height: 80,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Technology Wall Subsidiaries',
                          style: context.bodyLarge?.copyWith(color: Colors.white70),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/prorays.png',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 10,
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
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        'Al Madinah - Al Arid District - P. Muhammed Bin Abdulaziz St.',
                                        overflow: TextOverflow.clip,
                                        style: context.bodyMedium?.copyWith(color: Colors.white54),
                                      ),
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
                                        final Uri uri = Uri(scheme: 'https', path: 'prorays.techwall.com.sa');
                                        await launchUrl(uri);
                                      },
                                      child: Text(
                                        'prorays.techwall.com.sa',
                                        style: context.bodyMedium?.copyWith(color: Colors.white54),
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
                                      style: context.bodyMedium?.copyWith(color: Colors.white54),
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
                                      'info@prorays.techwall.com.sa',
                                      style: context.bodyMedium?.copyWith(color: Colors.white54),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/facebook.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/instagram.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/x.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ],
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
                                Image.asset(
                                  'assets/images/prorays.png',
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 10,
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
                                      style: context.bodyMedium?.copyWith(color: Colors.white54),
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
                                        style: context.bodyMedium?.copyWith(color: Colors.white54),
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
                                      style: context.bodyMedium?.copyWith(color: Colors.white54),
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
                                      style: context.bodyMedium?.copyWith(color: Colors.white54),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/facebook.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/instagram.svg',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/x.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Powered By',
                            style: context.headlineSmall?.copyWith(color: Colors.white70),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/en/about/accreditation');
                            },
                            child: Image.asset(
                              'assets/images/hcc.png',
                              height: 80,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 450,
                  child: VerticalDivider(
                    color: Colors.white70,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Software',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/software/sap');
                            },
                            child: Text(
                              'SAP Solutions',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/software/sage');
                            },
                            child: Text(
                              'Sage ERP',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/software/tally');
                            },
                            child: Text(
                              'Tally Solutions',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/software/microsoft');
                            },
                            child: Text(
                              'Microsoft',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/software/fortinet');
                            },
                            child: Text(
                              'Fortinet',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hardware',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/hardware/cctv');
                            },
                            child: Text(
                              'CCTVs',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/hardware/desktops');
                            },
                            child: Text(
                              'Desktops',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/hardware/firewalls');
                            },
                            child: Text(
                              'Firewalls',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/hardware/notebooks');
                            },
                            child: Text(
                              'Notebooks',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/hardware/printers');
                            },
                            child: Text(
                              'Printers',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/hardware/servers');
                            },
                            child: Text(
                              'Servers',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Company',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'About Us',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Clients',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Careers',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Legal',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/en/privacy');
                            },
                            child: Text(
                              'Privacy Policy',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Terms of Service',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Security',
                              style: context.bodyMedium?.copyWith(color: Colors.white54),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Contact Us',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '+966542575808',
                            style: context.bodyMedium?.copyWith(color: Colors.white54),
                          ),
                          Text(
                            'info@techwall.com.sa',
                            style: context.bodyMedium?.copyWith(color: Colors.white54),
                          ),
                          Text(
                            'B233, Office 37, Olaya District Computer Market',
                            overflow: TextOverflow.clip,
                            style: context.bodyMedium?.copyWith(color: Colors.white54),
                          ),
                          Text(
                            '12211 Riyadh, Saudi Arabia',
                            overflow: TextOverflow.clip,
                            style: context.bodyMedium?.copyWith(color: Colors.white54),
                          ),
                        ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  height: 40,
                  width: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/instagram.svg',
                  height: 40,
                  width: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/x.png',
                  height: 45,
                  width: 45,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            color: AppTheme.darkest.withOpacity(0.5),
            child: Center(
              child: Text(
                '©️ Developed By Technology Wall Team, Technology Wall Corporation. All Rights Reserved',
                style: context.bodyMedium?.copyWith(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
