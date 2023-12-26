import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../../core/controllers/metadata_controllers.dart';

class WebAccreditationBody extends StatelessWidget {
  const WebAccreditationBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Accreditation Page\n SAP ERP Accreditation \n Learn more about our partnership with HCC Middle East for supplying and implementing SAP Business One ERP Solutions. \n To ensure reliable quality and a competitve performance, Technology Wall sought to be a certified operator of SAP Business One ERP Solutions in Saudi Arabia. Powered by HCC Middle East, a certfied SAP Soultions provider in Dubai, United Arab Emirates, Technology Wall has made it possible to provide excelsior SAP implementation services and consultations. \n Enriching the market with strong partnerships. \n As part of our vision, Technology Wall is committed to providing top-level service qualities regardless of the required task. Every client is just as valuable as the next. At Technology Wall, we relentlessy seek flexible accommodations to suffice each and every business requirement. We understand VALUE, which is why our operations are always audited with international quality standardizations that ultimately benefits our strategic partners, potential partners and prospects, and our clients.',
        'en');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SlideInDown(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                  child: Center(
                    child: Text(
                      'Meet',
                      style: context.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 80),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Center(
                    child: Text(
                      'Technology Wall',
                      style: context.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/hcc.png',
                    height: 80,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                    height: 100,
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
                    child: Column(
                      children: [
                        Text(
                          'Enriching the market with strong partnerships',
                          overflow: TextOverflow.clip,
                          style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'To ensure reliable quality and a competitve performance, Technology Wall sought to be a certified operator of SAP Business One ERP Solutions in Saudi Arabia. Powered by HCC Middle East Consultancy FZCO, a certified SAP Solutions provider in Dubai, United Arab Emirates, Technology Wall has made it possible to provide excelsior SAP implementation services and consultations.',
                          style: context.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 400,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black45),
                        borderRadius: const BorderRadius.all(Radius.zero),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/partner.jpg'), fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, offset: Offset(5, 5), blurRadius: 2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'As part of our vision, Technology Wall is committed to providing top-level service qualities regardless of the required task. Every client is just as valuable as the next. At Technology Wall, we relentlessy seek flexible accommodations to suffice each and every business requirement. We understand VALUE, which is why our operations are always audited with international quality standardizations that ultimately benefits our strategic partners, potential partners and prospects, and our clients.',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: context.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Our Leadership',
                  style: context.headlineLarge,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('assets/images/essam.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Essameldin Ahmed',
                          style: context.headlineMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Technology Wall Regional MENA Director',
                          style: context.headlineSmall,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('assets/images/essam.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Muhib Marghilani',
                          style: context.headlineMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Technology Wall General Manager',
                          style: context.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
