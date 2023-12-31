// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'dart:html' as html;

class DevFooter extends StatelessWidget {
  const DevFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
      color: AppTheme.darkest.withOpacity(1),
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo1.webp',
                      width: 10.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            html.window.open('https:facebook.com/techwall.sa', 'about:blank');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/facebook.svg',
                            height: 5.h,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/instagram.svg',
                          height: 5.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Services',
                          style: context.labelLarge?.copyWith(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Hardware',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Software',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Maintenance',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Networks',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Development',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company',
                          style: context.labelLarge?.copyWith(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/en/about');
                          },
                          child: Text(
                            'About',
                            style: context.labelLarge?.copyWith(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/en/contact-us');
                          },
                          child: Text(
                            'Contact',
                            style: context.labelLarge?.copyWith(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Careers',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Branches',
                          style: context.labelLarge?.copyWith(color: Colors.white54),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Riyadh',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Al Madinah',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Dubai',
                          style: context.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          const Divider(),
          SizedBox(
            width: double.infinity,
            height: 3.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    html.window.open('https://techwall.com.sa/en/privacy', 'aboout:blank');
                  },
                  child: Text(
                    'Privacy Policy',
                    style: context.labelLarge?.copyWith(color: Colors.white70),
                  ),
                ),
                const VerticalDivider(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Terms of Service',
                    style: context.labelLarge?.copyWith(color: Colors.white70),
                  ),
                ),
                const VerticalDivider(),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Refund Policy',
                    style: context.labelLarge?.copyWith(color: Colors.white70),
                  ),
                ),
                const Spacer(),
                Text(
                  'Copyright ©️ Technology Wall 2024',
                  style: context.labelLarge?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
