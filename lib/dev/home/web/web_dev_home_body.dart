import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/dev/home/components/dev_call_action_container.dart';
import 'package:technology_wall/dev/home/components/dev_header.dart';
import 'package:technology_wall/dev/home/components/dev_left_feature_block.dart';
import 'package:technology_wall/dev/home/components/dev_metrics_container.dart';
import 'package:technology_wall/dev/home/components/dev_right_feature_block.dart';

import '../../../../core/controllers/metadata_controllers.dart';

class WebDevHomeBody extends StatelessWidget {
  const WebDevHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Explore our sample customizations for web development projects, and mobile and desktop applications. Technology Wall offers a comprehensive and customized services for designing, implementing, and hosting your enterprise on the web, computers, and phones.',
        'en');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const DevHeader(),
        SizedBox(
          height: 5.h,
        ),
        Center(
          child: Text(
            'How It Works',
            style: context.labelLarge?.copyWith(
                fontWeight: FontWeight.w600, fontSize: 18.sp, color: const Color(0xaa246af3).withOpacity(1)),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        const DevLeftFeature(
            title: 'Identify',
            subtitle: 'Optimized Target Audience Identification',
            description:
                'Technology Wall helps you identify potential client base that would boost your enterprise\'s income.',
            thumb: 'assets/dev_icons/brainstorm.svg',
            first: 'Market scanning forecast.',
            second: 'Surveys & polls to validate feasibility.',
            third: 'Comprehensive stakeholder mapping.',
            fourth: 'Create measurable SWOT analysis.'),
        SizedBox(
          height: 10.h,
        ),
        const DevRightFeatureBlock(
            title: 'Analyze',
            subtitle: 'Business Feasiblity Analysis Schema',
            description: 'Filter out or include core stakeholders and prioritize business logic objectives.',
            first: 'Analyze functionalities.',
            second: 'Prioritize objectives based on the scope.',
            third: 'Measure timeframes and revenue points.',
            fourth: 'Create success metrics and KPIs.',
            thumb: 'assets/dev_icons/analyze.svg'),
        SizedBox(
          height: 10.h,
        ),
        const DevLeftFeature(
            title: 'Implement',
            subtitle: 'Transform your concepts into a real business strong selling point',
            description:
                'Implementation of software requirements in accordance with standardized, effecient quality control.',
            thumb: 'assets/dev_icons/design.svg',
            first: 'Implement backend module.',
            second: 'Implement web services portal.',
            third: 'Implement mobile services solution.',
            fourth: 'Integrate into one enterprise-grade digital solution.'),
        SizedBox(
          height: 15.h,
        ),
        const DevMetricsContainer(mobile: '23', web: '14', hosting: '11', integrated: '6'),
        SizedBox(
          height: 15.h,
        ),
        Center(
          child: Text(
            'Additional Features',
            style: context.labelLarge?.copyWith(
                fontWeight: FontWeight.w600, fontSize: 18.sp, color: const Color(0xaa246af3).withOpacity(1)),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        const DevLeftFeature(
            title: 'Support',
            subtitle: 'Annual maintenance contracts ensure complete solution support',
            description: 'Reliable, expert support teams for any system issues.',
            thumb: 'assets/dev_icons/maintenance.svg',
            first: 'On-demand or dedicated teams.',
            second: 'Remote and on-site support.',
            third: 'Quick and effecient maintenance.',
            fourth: 'Support for platform-specific systems.'),
        SizedBox(
          height: 10.h,
        ),
        const DevRightFeatureBlock(
            title: 'Domains',
            subtitle: 'Personalized domain name providers',
            description: 'Match your enterprise identity with a unique domain name.',
            first: 'Establish a tailored domain name.',
            second: 'Migrate an existing domain.',
            third: 'Create new subdomains for business expansion.',
            fourth: 'Yearly or monthly subscription plans.',
            thumb: 'assets/dev_icons/domain.svg'),
        SizedBox(
          height: 10.h,
        ),
        const DevLeftFeature(
            title: 'Mail',
            subtitle: 'Personalized email addresses based on your identity',
            description: 'Extend your domain name\'s utility to serve as an email provider.',
            thumb: 'assets/dev_icons/mail.svg',
            first: 'Professional, personalized email addresses.',
            second: 'Administration panel for management.',
            third: 'Swift email server speeds.',
            fourth: 'Integrate with renowned providers.'),
        SizedBox(
          height: 10.h,
        ),
        const DevCallToActionContainer(),
      ],
    );
  }
}
