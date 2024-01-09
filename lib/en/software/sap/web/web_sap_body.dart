// ignore_for_file: avoid_web_libraries_in_flutter
import '../components/sap_intro_card.dart';
import '../components/sap_product_card.dart';
import '../controllers/sap_page_controllers.dart';
import '../../../shared/web/direct_dependencies_index.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
part '../components/sap_cloud_erp.g.dart';
part '../components/sap_b_tech_platform.g.dart';
part '../components/sap_ai.g.dart';
part '../components/sap_supply_chain.g.dart';
part '../components/sap_financial_management.g.dart';
part '../components/sap_crm.g.dart';
part '../components/sap_spend_management.g.dart';
part '../components/sap_human_capital.g.dart';
part '../components/sap_industry_solutions.g.dart';
part '../components/sap_b_network.g.dart';

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
          WebBlueHero(
              titleBig: 'SAP Enterprise Resource Planning (ERP)',
              titleSmall:
                  'SAP is one of the world’s leading producers of software for the management of business processes.',
              firstHead: 'Financial Management',
              firstSub: 'A core and vital enterprise management module, required for every business entity.',
              secondHead: 'CRM & Customer Experience',
              secondSub: 'Customer feedback moderation is essential for the growth of the enterprise.',
              actionPhrase: 'Discover the realm of SAP services.',
              hasButton: true,
              buttonTitle: 'Discover at sap.com',
              buttonAction: () {
                html.window.open('https://www.sap.com/', 'SAP Website');
              },
              image:
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3'),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
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
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Center(
                      child: SelectableText(
                        'SAP helps companies and organizations of all sizes and industries run their businesses profitably, adapt continuously, and grow sustainably.',
                        style: context.bodyLarge,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: SelectableText(
                        'What is SAP software used for?',
                        style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                      child: const Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 4,
                            child: SAPIntroCard(
                                description:
                                    'Traditional business models often decentralize data management, with each business function storing its own operational data in a separate database. This makes it difficult for employees from different business functions to access each other’s information. Furthermore, duplication of data across multiple departments increases IT storage costs and the risk of data errors.'),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 4,
                            child: SAPIntroCard(
                                description:
                                    'By centralizing data management, SAP software provides multiple business functions with a single view of the truth. This helps companies better manage complex business processes by giving employees of different departments easy access to real-time insights across the enterprise. As a result, businesses can accelerate workflows, improve operational efficiency, raise productivity, enhance customer experiences – and ultimately increase profits.'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: SelectableText(
                        'Available SAP Solutions',
                        style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: SelectableText(
                        'SAP offers solutions across a wide range of areas:',
                        style: context.bodyLarge,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 80.h,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 2.w,
                            mainAxisSpacing: 2.w,
                            childAspectRatio: 1.2),
                        children: [
                          SAPProductCard(
                            image: 'assets/icons/cloud.svg',
                            title: 'Cloud ERP',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPCloudERP();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/business-tech-platform.svg',
                            title: 'Business Technology Platform',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPBusinessTechnologyPlatform();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/ai.svg',
                            title: 'Artificial Intelligence',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPArtificialIntelligence();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/supply-chain.svg',
                            title: 'Supply Chain Management',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPSupplyChain();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/financial.svg',
                            title: 'Financial Management',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPFinancialManagement();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/crm.svg',
                            title: 'CRM & Customer Experience',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPCRM();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/spend.svg',
                            title: 'Spend Management',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPSpendManagement();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/human-capital.svg',
                            title: 'Human Capital Management',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPHumanCapital();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/industry.svg',
                            title: 'Industry Solutions',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPIndustrySolutions();
                                  });
                            },
                          ),
                          SAPProductCard(
                            image: 'assets/icons/business-network.svg',
                            title: 'Business Netowrk',
                            action: () async {
                              await showAdaptiveDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return const SAPBusinessNetwork();
                                  });
                            },
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
