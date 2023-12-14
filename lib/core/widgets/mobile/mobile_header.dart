import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class MobileHeader extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const MobileHeader({super.key, required this.sw, required this.sh, required this.ar});

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
        height: sh * 0.1,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: sw * 0.2,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Account',
                    style: context.bodySmall?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white70,
                    size: ar * 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
