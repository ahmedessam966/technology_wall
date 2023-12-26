import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/software_controllers.dart';
import 'package:technology_wall/base/en/software/software/components/microsoft_products_builder.dart';
import '../../../../../core/controllers/cart_controllers.dart';
import '../../../../../core/controllers/metadata_controllers.dart';
import '../../../shared/web/cart_widget.dart';

class WebSoftwareBody extends StatelessWidget {
  const WebSoftwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.updateHElement(
        'Technology Wall | Software and ERP',
        'A colloection of daily utility personal and enterprise-level fundamental software products.',
        'You can explore, search, and find information on Microsoft, Fortinet, Sage, SAP, Tally, and Zoho softwre products.');
    metadataControllers.injectPageSpecificContent(
        'Find your desired personal or enterprise level software here. All licensed and maintainable. Available software essentials include Microsof Office, Microsoft 365, Microsoft Windows 11, Microsoft Windows 10, SAP Business One ERP Solution, Tally ERP Solution, Sage ERP, Zoho ERP Solutions, Fortinet Security Software, and much more.',
        'en');
    return Consumer<SoftwareControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 80),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: SlideInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Boost Your Digital Entity With Powerful Software Solutions',
                          style: context.headlineMedium?.copyWith(
                              color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'For Personal Use',
                              style:
                                  context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
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
                          'Licenses for personal use',
                          style:
                              context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'For Enterprise',
                              style:
                                  context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
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
                          style:
                              context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Save valuable time and effort. Explore our integrated solutions plan.',
                          style:
                              context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 6,
                  child: Image.asset(
                    'assets/images/software.webp',
                    cacheHeight: 250,
                    height: 250,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
                height: 120,
                width: 150,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fs4hana.png?alt=media&token=79b3e395-e676-4d2b-b36f-cb9b746281c2',
                height: 120,
                width: 150,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                height: 120,
                width: 150,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
                height: 100,
                width: 120,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
                height: 120,
                width: 150,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            color: const Color(0xaaf1f1f1).withOpacity(1),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FMicrosoft%2Fmicrosoft.webp?alt=media&token=9f55e60e-2280-468c-8247-7159ed9d2a0e',
                      width: 400,
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
                              return const CartWidget();
                            });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white70,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'View Cart (${Provider.of<CartControllers>(context, listen: true).cart.keys.length})',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'Popular Microsoft Products',
                    style: context.headlineMedium,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(height: 550, child: MicrosoftProductsBuilder()),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Looking for other Microsoft products?',
                    style: context.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                    onPressed: () async {
                      Navigator.pushNamed(context, '/en/software/microsoft');
                    },
                    child: Text(
                      'Microsoft Software Center',
                      style: context.bodyLarge?.copyWith(color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Divider(),
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FFortinet%2Ffortinet.webp?alt=media&token=0b7d7ad7-159d-4355-8660-8257c4f1ab7c',
                  width: 400,
                ),
                Center(
                  child: Text(
                    'Fortinet Software Products',
                    style: context.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
