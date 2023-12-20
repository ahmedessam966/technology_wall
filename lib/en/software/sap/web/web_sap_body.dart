import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/sap_page_controllers.dart';

class WebSAPBody extends StatelessWidget {
  const WebSAPBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SAPPageControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 80),
            child: Semantics(
              container: true,
              header: true,
              label: 'SAP',
              value: 'SAP ERP Intro',
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 10,
                    child: SlideInLeft(
                      duration: const Duration(milliseconds: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SelectableText(
                            'SAP Enterprise Resource Planning (ERP)',
                            style: context.displayMedium?.copyWith(
                                color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SelectableText(
                            'SAP is one of the world’s leading producers of software for the management of business processes.',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SelectableText(
                                'Financial Management',
                                style: context.bodyLarge
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
                            'A core and vital enterprise management module, required for every business entity.',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SelectableText(
                                'CRM & Customer Experience',
                                style: context.bodyLarge
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
                            'Customer feedback moderation is essential for the growth of the enterprise.',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SelectableText(
                            'Discover the realm of SAP services.',
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
                            onPressed: () {
                              html.window.open('https://www.sap.com/', 'SAP Website');
                            },
                            child: Text(
                              'Discover at SAP.com',
                              style: context.bodyMedium?.copyWith(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            color: const Color(0xaaf7f7f7).withOpacity(1),
            child: Stack(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Opacity(
                        opacity: 0.05,
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fs4hana.png?alt=media&token=79b3e395-e676-4d2b-b36f-cb9b746281c2'),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 5,
                      child: Opacity(
                        opacity: 0.05,
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd'),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SelectableText(
                        'What does SAP do?',
                        style: context.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: SelectableText(
                        'SAP helps companies and organizations of all sizes and industries run their businesses profitably, adapt continuously, and grow sustainably.',
                        style: context.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SelectableText(
                        'What is SAP software used for?',
                        style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 4,
                            child: SelectableText(
                              'Traditional business models often decentralize data management, with each business function storing its own operational data in a separate database. This makes it difficult for employees from different business functions to access each other’s information. Furthermore, duplication of data across multiple departments increases IT storage costs and the risk of data errors.',
                              style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 4,
                            child: SelectableText(
                              'By centralizing data management, SAP software provides multiple business functions with a single view of the truth. This helps companies better manage complex business processes by giving employees of different departments easy access to real-time insights across the enterprise. As a result, businesses can accelerate workflows, improve operational efficiency, raise productivity, enhance customer experiences – and ultimately increase profits.',
                              style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: SelectableText(
                        'Available SAP Solutions',
                        style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SelectableText(
                        'SAP offers solutions across a wide range of areas:',
                        style: context.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 600,
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1),
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/cloud.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Cloud ERP',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/business-tech-platform.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Business Technology Platform',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/ai.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Artificial Intelligence',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/supply-chain.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Supply Chain Management',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/financial.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Financial Management',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/crm.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'CRM & Customer Experience',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/spend.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Spend Management',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/human-capital.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Human Capital Management',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/industry.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Industry Solutions',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                                elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
                                overlayColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return AppTheme.second;
                                  } else if (states.contains(MaterialState.hovered)) {
                                    return AppTheme.darkest.withOpacity(0.1);
                                  } else {
                                    return null;
                                  }
                                }),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: SvgPicture.asset(
                                    'assets/icons/business-network.svg',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Business Network',
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
