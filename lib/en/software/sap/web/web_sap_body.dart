// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/software/sap/components/sap_intro_card.dart';
import '../components/sap_product_card.dart';
import '../controllers/sap_page_controllers.dart';
import '../../../shared/web/direct_dependencies_index.dart';

class WebSAPBody extends StatelessWidget {
  const WebSAPBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'SAP Business One Solutions: ERP system that is specialized and tailored for small to medium-sized enterprises. Providing unparalleled modules and solutions including, Cloud ERP, Business Technology Plarform, Artificial Intelligence, Supply Chain Management, Financial Management, and much more.\n\n\n Get your certified SAP solutions with Technology Wall.',
        'en');
    return Consumer<SAPPageControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
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
                          style: context.headlineMedium?.copyWith(
                              color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SelectableText(
                          'SAP is one of the world’s leading producers of software for the management of business processes.',
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            SelectableText(
                              'Financial Management',
                              style:
                                  context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                            ),
                            SizedBox(
                              width: 1.w,
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            SelectableText(
                              'CRM & Customer Experience',
                              style:
                                  context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                            ),
                            SizedBox(
                              width: 1.w,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        SelectableText(
                          'Discover the realm of SAP services.',
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        BaseRectButton(
                          title: 'Discover at Sap.com',
                          action: () {
                            html.window.open('https://www.sap.com/', 'SAP Website');
                          },
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
                          SAPProductCard(image: 'assets/icons/cloud.svg', title: 'Cloud ERP'),
                          SAPProductCard(
                              image: 'assets/icons/business-tech-platform.svg',
                              title: 'Business Technology Platform'),
                          SAPProductCard(image: 'assets/icons/ai.svg', title: 'Artificial Intelligence'),
                          SAPProductCard(
                              image: 'assets/icons/supply-chain.svg', title: 'Supply Chain Management'),
                          SAPProductCard(image: 'assets/icons/financial.svg', title: 'Financial Management'),
                          SAPProductCard(image: 'assets/icons/crm.svg', title: 'CRM & Customer Experience'),
                          SAPProductCard(image: 'assets/icons/spend.svg', title: 'Spend Management'),
                          SAPProductCard(
                              image: 'assets/icons/human-capital.svg', title: 'Human Capital Management'),
                          SAPProductCard(image: 'assets/icons/industry.svg', title: 'Industry Solutions'),
                          SAPProductCard(
                              image: 'assets/icons/business-network.svg', title: 'Business Netowrk'),
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
