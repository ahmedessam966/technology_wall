import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../config/themes/app_theme.dart';

class MobileFooter extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const MobileFooter({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: sw * 0.025),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
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
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
              ],
            ),
          ],
        ),
        SizedBox(
          height: sh * 0.05,
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
          'B422, Olaya District, Riyadh, Saudi Arabia',
          style: context.bodySmall?.copyWith(color: Colors.white54),
        ),
        SizedBox(
          height: sh * 0.05,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          color: AppTheme.darkest.withOpacity(0.5),
          child: Center(
            child: Text(
              '©️ Technology Wall Corporation. All Rights Reserved',
              style: context.bodySmall?.copyWith(color: Colors.white54),
            ),
          ),
        ),
      ]),
    );
  }
}
