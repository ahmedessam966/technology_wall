import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import 'package:technology_wall/home/components/customers_carousel.dart';
import 'package:technology_wall/home/components/product_category_card.dart';

class WebHomeBody extends StatelessWidget {
  const WebHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: false);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Integrated Solutions - Fast and Easy',
                        style: context.displayMedium?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'All-Round Medium of Digitized Services',
                        style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Hardware Services',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      Text(
                        'Supplying primary hardware and up to complex servers',
                        style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Software Services',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      Text(
                        'Licensed, supported software solutions required for business intelligence',
                        style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Save valuable time and effort. Explore our integrated solutions plan.',
                        style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      const SizedBox(
                        height: 20,
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
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fserver-back.png?alt=media&token=f6276371-4a7b-4e89-aa7d-2d6799ff5819',
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              'Strategic Partners',
              style: context.headlineSmall?.copyWith(color: const Color(0xaaf7f7f7)),
            ),
          ),
          Container(
            height: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.darkest),
              ),
            ),
            child: const CustomersCarousel(),
          ),
          Container(
              color: const Color(0xaaf7f7f7).withOpacity(1),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Our Products',
                      style: context.displayMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/basics.svg',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Enterprise Essentials',
                        style: context.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Printers');
                              Navigator.pushNamed(context, '/hardware/printers');
                            },
                            category: 'Printers',
                            description:
                                'A wide range of printers, scanners, plotters, and much more, for business or personal utility.',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: ProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Notebooks');
                              Navigator.pushNamed(context, '/hardware/notebooks');
                            },
                            category: 'Notebooks',
                            description: 'Professional, guaranteed, and trendy collections - always.',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: ProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Servers');
                              Navigator.pushNamed(context, '/hardware/servers');
                            },
                            category: 'Servers',
                            description:
                                'State-of-the-art servers tailored to your required enterprise needs.',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: ProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Desktop PC');
                              Navigator.pushNamed(context, '/hardware/desktops');
                            },
                            category: 'Desktop PC',
                            description:
                                'The cornerstone of all digital enterprise management, with varied utilities and cost-effectiveness.',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      'Looking for more?',
                      style: context.bodyLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/hardware');
                      },
                      child: Text(
                        'Explore Inventory',
                        style: context.bodyMedium?.copyWith(color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/erp.svg',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ERP Essentials',
                        style: context.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 400,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fs4hana.png?alt=media&token=79b3e395-e676-4d2b-b36f-cb9b746281c2',
                                    height: 120,
                                    width: 150,
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                                    height: 120,
                                    width: 150,
                                  ),
                                ],
                              ),
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
                                    height: 100,
                                    width: 120,
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
                                    height: 120,
                                    width: 150,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'Powered by HCC, a certified SAP Solutions Partner, Technology Wall offers unique SAP Solutions for any business. Offering feasible and professional projection forecasts, determining the required scale of the ERP solution, implmentation and system deployments through client-customized CI/CD operations, and an optional annual maintenance contract carried out by our expert certified SAP Consultants.',
                                style: context.bodyMedium,
                                textAlign: TextAlign.justify,
                              ),
                              Row(
                                children: [
                                  SelectableText(
                                    'Learn more about our our SAP accreditation and parternship',
                                    style: context.bodyMedium,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'Learn More',
                                      style: context.bodyMedium?.copyWith(color: Colors.blue.shade700),
                                    ),
                                  )
                                ],
                              ),
                              SelectableText(
                                'Technology Wall is directly licensed by Sage ERP System Corporation to propose, design, and implement Sage ERP Solutions. Having a dedicated team of Sage Solutions experts, Technology Wall also offers a competitive post-sales support plan for implemented Sage Solutions - 24/7',
                                style: context.bodyMedium,
                                textAlign: TextAlign.justify,
                              ),
                              SelectableText(
                                'Technology Wall aims to fully and professionally serve the business logic requirements of enterprises of all scales - small, medium, and expansive. To serve such purpose, Technology Wall offers its services for Tally Solutions as a certified distributor.',
                                style: context.bodyMedium,
                                textAlign: TextAlign.justify,
                              ),
                              const SelectableText(
                                  'Assess your business\'s needs - your enterprise can be optimized for Sage, Tally, or SAP Solutions. For more information on how we assess readiness and pricing plans, and which ERP would suit your business requirements:'),
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
                                  'Contact Pre-Sales',
                                  style: context.bodyMedium?.copyWith(color: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ]);
  }
}
