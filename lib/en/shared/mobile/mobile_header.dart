import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

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
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 90.px,
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Portal',
                    style: context.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white70,
                    size: 15.px,
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
