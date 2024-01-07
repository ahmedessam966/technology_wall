// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/software/sap/components/ai_hero.dart';
import 'package:technology_wall/en/software/sap/components/business_network_hero.dart';
import 'package:technology_wall/en/software/sap/components/business_tech_hero.dart';
import 'package:technology_wall/en/software/sap/components/cloud_hero.dart';
import 'package:technology_wall/en/software/sap/components/crm_hero.dart';
import 'package:technology_wall/en/software/sap/components/financial_hero.dart';
import 'package:technology_wall/en/software/sap/components/human_capital_hero.dart';
import 'package:technology_wall/en/software/sap/components/industry_hero.dart';
import 'package:technology_wall/en/software/sap/components/sap_intro_card.dart';
import 'package:technology_wall/en/software/sap/components/spend_hero.dart';
import 'package:technology_wall/en/software/sap/components/supply_chain_hero.dart';
import '../components/sap_product_card.dart';
import '../controllers/sap_page_controllers.dart';
import '../../../shared/web/direct_dependencies_index.dart';

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
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 80.h,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 2.w,
                            mainAxisSpacing: 2.w,
                            childAspectRatio: 1),
                        children: const [
                          Hero(
                              tag: 'cloud_hero',
                              child: SAPProductCard(
                                image: 'assets/icons/cloud.svg',
                                title: 'Cloud ERP',
                                destination: CloudERPHero(),
                              )),
                          Hero(
                            tag: 'business_tech_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/business-tech-platform.svg',
                              title: 'Business Technology Platform',
                              destination: BusinessTechHero(),
                            ),
                          ),
                          Hero(
                            tag: 'ai_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/ai.svg',
                              title: 'Artificial Intelligence',
                              destination: ArtificialIntelligenceHero(),
                            ),
                          ),
                          Hero(
                            tag: 'supply_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/supply-chain.svg',
                              title: 'Supply Chain Management',
                              destination: SupplyChainHero(),
                            ),
                          ),
                          Hero(
                            tag: 'financial_management_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/financial.svg',
                              title: 'Financial Management',
                              destination: FinancialManagementHero(),
                            ),
                          ),
                          Hero(
                            tag: 'crm_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/crm.svg',
                              title: 'CRM & Customer Experience',
                              destination: CRMHero(),
                            ),
                          ),
                          Hero(
                            tag: 'spend_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/spend.svg',
                              title: 'Spend Management',
                              destination: SpendManagementHero(),
                            ),
                          ),
                          Hero(
                            tag: 'human_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/human-capital.svg',
                              title: 'Human Capital Management',
                              destination: HumanCapitalHero(),
                            ),
                          ),
                          Hero(
                            tag: 'industry_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/industry.svg',
                              title: 'Industry Solutions',
                              destination: IndustrySolutionsHero(),
                            ),
                          ),
                          Hero(
                            tag: 'business_net_hero',
                            child: SAPProductCard(
                              image: 'assets/icons/business-network.svg',
                              title: 'Business Netowrk',
                              destination: BusinessNetworkHero(),
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
