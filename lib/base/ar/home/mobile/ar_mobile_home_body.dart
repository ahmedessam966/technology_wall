import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../components/ar_horizontal_product_category_card.dart';

class ARMobileHomeBody extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const ARMobileHomeBody({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Integrated Solutions - Fast and Easy',
          style: context.bodyLarge
              ?.copyWith(color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
        ),
        Text(
          'All-Round Medium of Digitized Services',
          style: context.bodySmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: sh * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hardware Services',
              style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
            ),
            SizedBox(
              width: sw * 0.01,
            ),
            const Icon(
              Icons.arrow_right_alt_sharp,
              color: Color(0xaaffffff),
            ),
          ],
        ),
        Text(
          'Supplying primary hardware and up to complex servers',
          textAlign: TextAlign.center,
          style: context.bodySmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: sh * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Software Services',
              style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
            ),
            SizedBox(
              width: sw * 0.01,
            ),
            const Icon(
              Icons.arrow_right_alt_sharp,
              color: Color(0xaaffffff),
            ),
          ],
        ),
        Text(
          'Licensed, supported software solutions required for business intelligence',
          textAlign: TextAlign.center,
          style: context.bodySmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: sh * 0.04,
        ),
        Text(
          'Save valuable time and effort. Explore our integrated solutions plan.',
          textAlign: TextAlign.center,
          style: context.bodyMedium?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: sh * 0.04,
        ),
        ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
                side: const BorderSide(color: Colors.white70),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return const Color(0xaa7c9cc1).withOpacity(1);
              } else {
                return const Color(0xaa071923).withOpacity(1);
              }
            }),
          ),
          onPressed: () {},
          child: Text(
            'Explore Now',
            style: context.bodyMedium?.copyWith(color: Colors.white70),
          ),
        ),
        SizedBox(
          height: sh * 0.04,
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Our Products',
                  style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: sh * 0.03,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/basics.svg',
                    height: sh * 0.03,
                  ),
                  SizedBox(
                    width: sw * 0.02,
                  ),
                  Text(
                    'Enterprise Essentials',
                    style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              ARHorizontalProductCategoryCard(
                  isMobile: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/hardware/printers');
                  },
                  category: 'Printers',
                  imagePath:
                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
              SizedBox(
                height: sh * 0.01,
              ),
              ARHorizontalProductCategoryCard(
                  isMobile: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/hardware/notebooks');
                  },
                  category: 'Notebooks',
                  imagePath:
                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
              SizedBox(
                height: sh * 0.01,
              ),
              ARHorizontalProductCategoryCard(
                  isMobile: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/hardware/servers');
                  },
                  category: 'Servers',
                  imagePath:
                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
              SizedBox(
                height: sh * 0.01,
              ),
              ARHorizontalProductCategoryCard(
                  isMobile: true,
                  onPressed: () {
                    Navigator.pushNamed(context, '/hardware/desktops');
                  },
                  category: 'Desktop PC',
                  imagePath:
                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
              SizedBox(
                height: sh * 0.02,
              ),
              Center(
                child: Text(
                  'Looking for more?',
                  style: context.bodyMedium,
                ),
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                          side: const BorderSide(color: Colors.white70),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(const Color(0xaa071923).withOpacity(1))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/hardware');
                  },
                  child: Text(
                    'Explore Inventory',
                    style: context.bodySmall?.copyWith(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: sh * 0.025,
              ),
              Divider(
                indent: sw * 0.015,
                endIndent: sw * 0.015,
              ),
              SizedBox(
                height: sh * 0.025,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/erp.svg',
                    height: sh * 0.03,
                  ),
                  SizedBox(
                    width: sw * 0.02,
                  ),
                  Text(
                    'ERP Essentials',
                    style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                    height: sh * 0.08,
                    width: sw * 0.15,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fs4hana.png?alt=media&token=79b3e395-e676-4d2b-b36f-cb9b746281c2',
                    height: sh * 0.08,
                    width: sw * 0.15,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
                    height: sh * 0.08,
                    width: sw * 0.15,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
                    height: sh * 0.08,
                    width: sw * 0.15,
                  ),
                ],
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              SelectableText(
                'Powered by HCC, a certified SAP Solutions Partner, Technology Wall offers unique SAP Solutions for any business. Offering feasible and professional projection forecasts, determining the required scale of the ERP solution, implmentation and system deployments through client-customized CI/CD operations, and an optional annual maintenance contract carried out by our expert certified SAP Consultants.',
                style: context.bodySmall,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              GestureDetector(
                onTap: () {},
                child: SelectableText(
                  'Learn more about our our SAP accreditation and parternship',
                  style: context.bodySmall?.copyWith(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              SelectableText(
                'Technology Wall is directly licensed by Sage ERP System Corporation to propose, design, and implement Sage ERP Solutions. Having a dedicated team of Sage Solutions experts, Technology Wall also offers a competitive post-sales support plan for implemented Sage Solutions - 24/7.',
                style: context.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              SelectableText(
                'Technology Wall aims to fully and professionally serve the business logic requirements of enterprises of all scales - small, medium, and expansive. To serve such purpose, Technology Wall offers its services for Tally Solutions as a certified distributor.',
                style: context.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: sh * 0.01,
              ),
              const SelectableText(
                  'Assess your business\'s needs - your enterprise can be optimized for Sage, Tally, or SAP Solutions. For more information on how we assess readiness and pricing plans, and which ERP would suit your business requirements:'),
              SizedBox(
                height: sh * 0.025,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                        side: const BorderSide(color: Colors.white70),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return const Color(0xaa7c9cc1).withOpacity(1);
                      } else {
                        return const Color(0xaa071923).withOpacity(1);
                      }
                    }),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Contact Pre-Sales',
                    style: context.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
