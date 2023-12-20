import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import '../components/customers_carousel.dart';
import '../components/product_category_card.dart';
import 'package:technology_wall/core/widgets/web/web_purchase_order.dart';

class WebHomeBody extends StatelessWidget {
  const WebHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: true);
    return Directionality(
      textDirection: provider.isEnglish ? TextDirection.ltr : TextDirection.rtl,
      child: Column(
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
                        SelectableText(
                          'Hello, This is ARABIIIIIII',
                          style: provider.isEnglish
                              ? context.headlineMedium?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)
                              : context.headlineLarge?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SelectableText(
                          'home_slogan_small',
                          style: provider.isEnglish
                              ? context.headlineSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)
                              : context.headlineSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            SelectableText(
                              'home_service1_title',
                              style: provider.isEnglish
                                  ? context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1))
                                  : context.displayLarge
                                      ?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
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
                        SelectableText(
                          'home_service1_sub',
                          style: provider.isEnglish
                              ? context.headlineSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)
                              : context.titleSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SelectableText(
                              'home_service2_title',
                              style: provider.isEnglish
                                  ? context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1))
                                  : context.displayLarge
                                      ?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
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
                        SelectableText(
                          'home_service2_sub',
                          style: provider.isEnglish
                              ? context.headlineSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)
                              : context.headlineMedium?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SelectableText(
                          'home_services_end',
                          style: provider.isEnglish
                              ? context.headlineSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)
                              : context.titleSmall?.copyWith(
                                  color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
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
                          onPressed: () async {
                            await showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return const WebPurchaseOrder();
                                });
                          },
                          child: Text(
                            'create_po_button',
                            style: provider.isEnglish
                                ? context.bodyLarge?.copyWith(
                                    color: const Color(0xaad1d7e0).withOpacity(1),
                                    fontWeight: FontWeight.w600)
                                : context.displayLarge?.copyWith(
                                    color: const Color(0xaad1d7e0).withOpacity(1),
                                    fontWeight: FontWeight.w600),
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
                'home_partners_title',
                style: provider.isEnglish
                    ? context.headlineMedium?.copyWith(color: const Color(0xaaf7f7f7))
                    : context.titleMedium?.copyWith(color: const Color(0xaaf7f7f7)),
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
                        'our_products',
                        style: provider.isEnglish
                            ? context.headlineLarge
                                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)
                            : context.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
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
                          'enterprise_essentials',
                          style: provider.isEnglish
                              ? context.headlineMedium?.copyWith(fontWeight: FontWeight.w600)
                              : context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
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
                              category: 'home_printers_tab',
                              description: 'home_printers_desc',
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
                              category: 'home_notebooks_tab',
                              description: 'home_notebooks_desc',
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
                              category: 'home_servers_tab',
                              description: 'home_servers_desc',
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
                              category: 'home_desktops_tab',
                              description: 'home_desktops_desc',
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
                        'looking_for_more',
                        style: provider.isEnglish ? context.bodyLarge : context.displayLarge,
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
                          'explore_inventory_button',
                          style: provider.isEnglish
                              ? context.bodyLarge?.copyWith(color: Colors.white70)
                              : context.bodyMedium?.copyWith(color: Colors.white70),
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
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/erp.svg',
                            height: 50,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'erp_essentials',
                            style: provider.isEnglish
                                ? context.headlineMedium?.copyWith(fontWeight: FontWeight.w600)
                                : context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/hcc.png',
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
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
                              flex: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText(
                                    'home_erp_segment1',
                                    style: provider.isEnglish ? context.bodyLarge : context.displayLarge,
                                    textAlign: provider.isEnglish ? TextAlign.justify : TextAlign.right,
                                  ),
                                  Row(
                                    children: [
                                      SelectableText(
                                        'home_erp_segment2',
                                        style: provider.isEnglish ? context.bodyLarge : context.displayLarge,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'learn_more_link',
                                          style: provider.isEnglish
                                              ? context.bodyLarge?.copyWith(color: Colors.blue.shade700)
                                              : context.displayLarge?.copyWith(color: Colors.blue.shade700),
                                        ),
                                      )
                                    ],
                                  ),
                                  SelectableText(
                                    'home_erp_segment3',
                                    style: provider.isEnglish ? context.bodyLarge : context.displayLarge,
                                    textAlign: provider.isEnglish ? TextAlign.justify : TextAlign.right,
                                  ),
                                  SelectableText(
                                    'home_erp_segment4',
                                    style: provider.isEnglish ? context.bodyLarge : context.displayLarge,
                                    textAlign: provider.isEnglish ? TextAlign.justify : TextAlign.right,
                                  ),
                                  SelectableText(
                                    'home_erp_segment5',
                                    style: provider.isEnglish ? context.bodyLarge : context.displayLarge,
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
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/software/sap');
                                    },
                                    child: Text(
                                      'contact_psales_button',
                                      style: provider.isEnglish
                                          ? context.bodyLarge?.copyWith(color: Colors.white70)
                                          : context.bodyMedium?.copyWith(color: Colors.white70),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
    );
  }
}
