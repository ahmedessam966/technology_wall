import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../core/controllers/metadata_controllers.dart';

class WebAboutBody extends StatelessWidget {
  const WebAboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'About Page\n  Discover what drives Technology Wall. Our motivation, vision, and goals. \n The beginning of Technology Wall; how it started. \n Founded by Muhib Marghilani, Technology Wall\'s General Director, and Essameldin Ahmed, Technology Wall\'s Regional MENA Director, the origins of Technology Wall extend back to 2000, which have then transformed to establish a pioneering entity in the field of technology and information systems. Technology Wall has maintained sustainable and feasible expansion strategies that have allowed for the entity\'s growth for the past 23 years, providing unparalleled quality services for more than 50 clients. \n Technology Wall aims to be a major contributor in the digitization initiative in Saudi Arabia. \n In line with the vision of the Kingdom of Saudi Arabia for the year 2030, we aim to contribute in the digital infrastructure development; keeping pace with developments in the field of technology is one of our paramount priorities. Technology Wall thrives to achieve customer satisfaction and providing comprehensive services stemming from our philosophy represented by placing the client in the first place.',
        'en');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SlideInUp(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.05,
                  child: SvgPicture.asset(
                    'assets/icons/qqquad.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: Text(
                          'About Us',
                          style: context.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 50),
                        ),
                      ),
                    ),
                  ],
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
                          'The beginning of Technology Wall; how it started.',
                          overflow: TextOverflow.clip,
                          style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Founded by Muhib Marghilani, Technology Wall\'s General Director, and Essameldin Ahmed, Technology Wall\'s Regional MENA Director, the origins of Technology Wall extend back to 2000, which have then transformed to establish a pioneering entity in the field of technology and information systems. Technology Wall has maintained sustainable and feasible expansion strategies that have allowed for the entity\'s growth for the past 23 years, providing unparalleled quality services for more than 50 clients.',
                          style: context.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Colors.grey),
                                boxShadow: const [
                                  BoxShadow(offset: Offset(0, 0), color: Colors.black45, blurRadius: 3),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 90,
                                backgroundImage: AssetImage('assets/images/essam.png'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Colors.grey),
                                boxShadow: const [
                                  BoxShadow(offset: Offset(0, 0), color: Colors.black45, blurRadius: 3),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 90,
                                backgroundImage: AssetImage('assets/images/essam.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 450,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black45),
                        borderRadius: const BorderRadius.all(Radius.zero),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/aspire.webp'), fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, offset: Offset(5, 5), blurRadius: 2),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          'Technology Wall aims to be a major contributor in the digitization initiative in Saudi Arabia.',
                          overflow: TextOverflow.clip,
                          style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'In line with the vision of the Kingdom of Saudi Arabia for the year 2030, we aim to contribute in the digital infrastructure development; keeping pace with developments in the field of technology is one of our paramount priorities. Technology Wall thrives to achieve customer satisfaction and providing comprehensive services stemming from our philosophy represented by placing the client in the first place.',
                          style: context.bodyLarge,
                        ),
                      ],
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
