import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/dev/en/home/components/dev_coustomer_carousel.dart';

import '../../../../core/controllers/metadata_controllers.dart';

class WebDevHomeBody extends StatelessWidget {
  const WebDevHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Explore our sample customizations for web development projects, and mobile and desktop applications. Technology Wall offers a comprehensive and customized services for designing, implementing, and hosting your enterprise on the web, computers, and phones.',
        'en');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 650,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(colors: [
                const Color(0xaa26344b).withOpacity(1),
                const Color(0xaa246af3),
              ], begin: AlignmentDirectional.topCenter, end: AlignmentDirectional.bottomCenter),
              boxShadow: const [BoxShadow(color: Colors.black87, offset: Offset(5, 5), blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/dev_images/code.png',
                      height: 150,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Welcome to Development Center',
                      style: context.labelLarge
                          ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Boost digital business presence.',
                    style: context.labelLarge
                        ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Design, pace, implement, and affirm your digital print.',
                    style: context.labelLarge
                        ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200),
                  child: Text(
                    'All the tools and technologies needed to create your degital entity. Reach out to your clients through our comprehensive web development kit plans.',
                    textAlign: TextAlign.center,
                    style:
                        context.headlineSmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xaaf5f5f5).withOpacity(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Request Now',
                        style: context.labelLarge?.copyWith(
                          color: const Color(0xaa264990).withOpacity(1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.white24;
                          } else {
                            return null;
                          }
                        }),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Showcases',
                            style: context.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  height: 150,
                  child: DevCustomersCarousel(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'How It Works',
              style: context.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: const Color(0xaa246af3).withOpacity(1)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const BorderDirectional(
                              start: BorderSide(color: Colors.white30),
                              end: BorderSide(color: Colors.white30))),
                      child: SvgPicture.asset(
                        'assets/dev_icons/brainstorm.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Identify',
                          style: context.labelLarge?.copyWith(
                              color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Optimized Target Audience Identification',
                          style: context.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xaa26344b).withOpacity(1),
                          ),
                        ),
                        Text(
                          'Technology Wall helps you identify potential client base that would boost your enterprise\'s income.',
                          style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Market scanning forecast.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Surveys & polls to validate feasibility.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Comprehensive stakeholder mapping.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Create measurable SWOT analysis.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Analyze',
                          style: context.labelLarge?.copyWith(
                              color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Business Feasiblity Analysis Schema',
                          style: context.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xaa26344b).withOpacity(1),
                          ),
                        ),
                        Text(
                          'Filter out or include core stakeholders and prioritize business logic objectives.',
                          style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Analyze functionalities.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Prioritize objectives based on the scope.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Measure timeframes and revenue points.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Create success metrics and KPIs.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const BorderDirectional(
                              start: BorderSide(color: Colors.white30),
                              end: BorderSide(color: Colors.white30))),
                      child: SvgPicture.asset(
                        'assets/dev_icons/analyze.svg',
                        fit: BoxFit.contain,
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
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const BorderDirectional(
                              start: BorderSide(color: Colors.white30),
                              end: BorderSide(color: Colors.white30))),
                      child: SvgPicture.asset(
                        'assets/dev_icons/design.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Implement',
                          style: context.labelLarge?.copyWith(
                              color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Transform your concepts into a real business strong selling point',
                          style: context.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xaa26344b).withOpacity(1),
                          ),
                        ),
                        Text(
                          'Implementation of software requirements in accordance with standardized, effecient quality control.',
                          style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Implement backend module.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Implement web services portal.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Implement mobile services solution.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Integrate into one enterprise-grade digital solution.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Additional Features',
              style: context.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: const Color(0xaa246af3).withOpacity(1)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const BorderDirectional(
                              start: BorderSide(color: Colors.white30),
                              end: BorderSide(color: Colors.white30))),
                      child: SvgPicture.asset(
                        'assets/dev_icons/maintenance.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Support',
                          style: context.labelLarge?.copyWith(
                              color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Annual maintenance contracts ensure complete solution support',
                          style: context.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xaa26344b).withOpacity(1),
                          ),
                        ),
                        Text(
                          'Reliable, expert support teams for any system issues.',
                          style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'On-demand or dedicated teams.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Remote and on-site support.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Quick and effecient maintenance.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Support for platform-specific systems.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Domains',
                          style: context.labelLarge?.copyWith(
                              color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Personalized domain name providers',
                          style: context.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xaa26344b).withOpacity(1),
                          ),
                        ),
                        Text(
                          'Match your enterprise identity with a unique domain name.',
                          style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Establish a tailored domain name.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Migrate an existing domain.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Create new subdomains for business expansion.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Yearly or monthly subscription plans.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const BorderDirectional(
                              start: BorderSide(color: Colors.white30),
                              end: BorderSide(color: Colors.white30))),
                      child: SvgPicture.asset(
                        'assets/dev_icons/domain.svg',
                        fit: BoxFit.contain,
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
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const BorderDirectional(
                              start: BorderSide(color: Colors.white30),
                              end: BorderSide(color: Colors.white30))),
                      child: SvgPicture.asset(
                        'assets/dev_icons/mail.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mail',
                          style: context.labelLarge?.copyWith(
                              color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Personalized email addresses based on your identity',
                          style: context.labelLarge?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xaa26344b).withOpacity(1),
                          ),
                        ),
                        Text(
                          'Extend your domain name\'s utility to serve as an email provider.',
                          style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Professional email addresses.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Administration panel for management.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Swift email server speeds.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: const Color(0xaa2af598).withOpacity(1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Integrate with renowned providers.',
                              style: context.labelLarge?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
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
    );
  }
}
