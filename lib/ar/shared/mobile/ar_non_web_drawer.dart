import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class ARNonWebDrawer extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const ARNonWebDrawer({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        width: sw * 0.75,
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        backgroundColor: AppTheme.darkest.withOpacity(0.95),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.05, vertical: sh * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: sh * 0.05,
                ),
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              const Divider(
                color: Color(0xaaf7f7f7),
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              Text(
                'Enterprise Essentials',
                style: context.bodyLarge?.copyWith(color: Colors.white70),
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dekstops',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notebooks',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Printers',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Servers',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Inventory',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              Text(
                'ERP Essentials',
                style: context.bodyLarge?.copyWith(color: Colors.white70),
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Microsoft',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sage',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SAP Business One',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SAP S4/HANA',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tally Solutions',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              Text(
                'Company',
                style: context.bodyLarge?.copyWith(color: Colors.white70),
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Accreditations',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About Us',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clients',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Careers',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy Policy',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms of Service',
                    style: context.bodySmall?.copyWith(color: Colors.white38),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white38,
                      size: ar * 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              Center(
                child: Text(
                  '+966542575808',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
              Center(
                child: Text(
                  'info@tech-wall.me',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
              Center(
                child: Text(
                  'B233, Olaya District, Riyadh, Saudi Arabia',
                  textAlign: TextAlign.center,
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
