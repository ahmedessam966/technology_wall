import 'package:flutter/material.dart';
import '../../shared/web/direct_dependencies_index.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/shared/web/web_purchase_order.dart';
import 'package:technology_wall/global/controllers/app_controllers.dart';
import 'package:technology_wall/en/home/components/featured_carousel.dart';
import '../components/customers_carousel.dart';
import '../components/product_category_card.dart';

class WebHomeBody extends StatelessWidget {
  const WebHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: true);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          WebBlueHero(
              titleBig: 'Integrated Solutions - Easy and Reliable',
              titleSmall: 'All-Round Medium of Digitized Services',
              firstHead: 'Hardware Services',
              firstSub: 'Supplying primary hardware and up to complex servers',
              secondHead: 'Software Services',
              secondSub: 'Licensed, supported software solutions required for business intelligence',
              actionPhrase: 'Save valuable time and effort. Explore our integrated solutions plan',
              hasButton: true,
              buttonTitle: 'Create Purchase Order',
              buttonAction: () async {
                await showAdaptiveDialog(
                    context: context,
                    builder: (ctx) {
                      return const WebPurchaseOrder();
                    });
              },
              image:
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fserver-back.png?alt=media&token=f6276371-4a7b-4e89-aa7d-2d6799ff5819'),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text('Strategic Partners',
                style: context.headlineMedium?.copyWith(color: const Color(0xaaf7f7f7))),
          ),
          Container(
            height: 20.h,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.darkest),
              ),
            ),
            child: const CustomersCarousel(),
          ),
          Container(
            color: const Color(0xaaf7f7f7).withOpacity(1),
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Offers & Featured Products',
                      style:
                          context.headlineLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 90.h,
                  child: const FeaturedCarousel(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text('Explore Products & Services',
                      style:
                          context.headlineLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/basics.svg',
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    SelectableText('Enterprise Essentials',
                        style: context.headlineMedium?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 6,
                      child: ProductCategoryCard(
                          onPressed: () {
                            provider.changePage('Technology Wall | Printers');
                            Navigator.pushNamed(context, '/en/hardware/printers');
                          },
                          category: 'Printers',
                          description:
                              'A wide range of printers, scanners, plotters, and much more, for business or personal utility',
                          imagePath:
                              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: ProductCategoryCard(
                          onPressed: () {
                            provider.changePage('Technology Wall | Notebooks');
                            Navigator.pushNamed(context, '/en/hardware/notebooks');
                          },
                          category: 'Notebooks',
                          description: 'Professional, guaranteed, and trendy collections - always',
                          imagePath:
                              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: ProductCategoryCard(
                          onPressed: () {
                            provider.changePage('Technology Wall | Servers');
                            Navigator.pushNamed(context, '/en/hardware/servers');
                          },
                          category: 'Servers',
                          description: 'State-of-the-art servers tailored to your required enterprise needs',
                          imagePath:
                              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 6,
                      child: ProductCategoryCard(
                          onPressed: () {
                            provider.changePage('Technology Wall | Desktop PC');
                            Navigator.pushNamed(context, '/en/hardware/desktops');
                          },
                          category: 'Desktop PC',
                          description:
                              'The cornerstone of all digital enterprise management, with varied utilities and cost-effectiveness',
                          imagePath:
                              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fimac.webp?alt=media&token=b2f1e6e9-8666-4a5f-87d3-bc61dd946663'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Text(
                    'Looking For More?',
                    style: context.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseRectButton(
                    child: Text('Explore Inventory',
                        style: context.bodyLarge?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                    action: () {
                      Navigator.pushNamed(context, '/en/hardware');
                    },
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Divider(
                  indent: 3.w,
                  endIndent: 3.w,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/erp.svg',
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SelectableText('ERP Essentials',
                          style: context.headlineMedium?.copyWith(fontWeight: FontWeight.w600)),
                      const Spacer(),
                      Image.asset(
                        'assets/images/hcc.png',
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                  child: SizedBox(
                    height: 60.h,
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
                                    height: 12.h,
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                                    height: 12.h,
                                  ),
                                ],
                              ),
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
                                    height: 10.h,
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
                                    height: 12.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'Powered by HCC, a certified SAP Solutions Partner, Technology, HCC\'s Extended Business Member in Saudi Arabia, Wall offers unique SAP Solutions for any business. Offering feasible and professional projection forecasts, determining the required scale of the ERP solution, implmentation and system deployments through client-customized CI/CD operations, and an optional annual maintenance contract carried out by our expert certified SAP Consultants.',
                                style: context.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                              Row(
                                children: [
                                  SelectableText(
                                    'Learn more about our our SAP accreditation and parternship',
                                    style: context.bodyLarge,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/en/software/sap');
                                    },
                                    child: Text('Learn More',
                                        style: context.bodyLarge?.copyWith(color: Colors.blue.shade700)),
                                  )
                                ],
                              ),
                              SelectableText(
                                'Technology Wall is directly licensed by Sage ERP System Corporation to propose, design, and implement Sage ERP Solutions. Having a dedicated team of Sage Solutions experts, Technology Wall also offers a competitive post-sales support plan for implemented Sage Solutions - 24/7.',
                                style: context.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                              SelectableText(
                                'Technology Wall aims to fully and professionally serve the business logic requirements of enterprises of all scales - small, medium, and expansive. To serve such purpose, Technology Wall offers its services for Tally Solutions as a certified distributor.',
                                style: context.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                              SelectableText(
                                'Assess your business\'s needs - your enterprise can be optimized for Sage, Tally, or SAP Solutions. For more information on how we assess readiness and pricing plans, and which ERP would suit your business requirements:',
                                style: context.bodyLarge,
                              ),
                              BaseRectButton(
                                child: Text('Contact Pre-Sales',
                                    style: context.bodyLarge?.copyWith(
                                        color: const Color(0xaad1d7e0).withOpacity(1),
                                        fontWeight: FontWeight.w600)),
                                action: () {
                                  Navigator.pushNamed(context, '/en/software/sap');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
