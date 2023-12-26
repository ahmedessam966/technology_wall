import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/software_controllers.dart';
import 'package:technology_wall/en/software/software/components/microsoft_card.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../core/controllers/metadata_controllers.dart';

class WebSoftwareBody extends StatelessWidget {
  const WebSoftwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Find your desired personal or enterprise level software here. All licensed and maintainable. Available software essentials include Microsof Office, Microsoft 365, Microsoft Windows 11, Microsoft Windows 10, SAP Business One ERP Solution, Tally ERP Solution, Sage ERP, Zoho ERP Solutions, Fortinet Security Software, and much more.',
        'en');
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
                      'Licenses for personal use',
                      style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'For Enterprise',
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
                      'Licensed, supported software soultions required for business intelligence',
                      style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Save valuable time and effort. Explore our integrated solutions plan.',
                      style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Image.asset(
                'assets/images/software.webp',
                height: 250,
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
        Consumer<SoftwareControllers>(builder: (context, provider, _) {
          return Container(
            color: const Color(0xaaf7f7f7).withOpacity(1),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Microsoft Products',
                      style: context.headlineMedium,
                    ),
                    Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FMicrosoft%2Fmicrosoft.webp?alt=media&token=7246a7e7-0c2e-4c78-b767-2fc8318b5726'),
                  ],
                ),
                SizedBox(
                  height: 550,
                  child: FutureBuilder(
                    future: provider.getMicrosoft(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SpinKitCircle(
                            color: AppTheme.darkest,
                          ),
                        );
                      } else {
                        return GridView.builder(
                            physics: const RangeMaintainingScrollPhysics(),
                            itemCount: provider.microsoftList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.7),
                            itemBuilder: (context, index) {
                              final microsoft = provider.microsoftList[index];
                              return MicrosoftCard(microsoft: microsoft);
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
