import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/dev/home/components/dev_coustomer_carousel.dart';

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
        Container(
          width: double.infinity,
          height: 85.h,
          padding: EdgeInsets.symmetric(vertical: 3.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.px),
              bottomRight: Radius.circular(10.px),
            ),
            gradient: LinearGradient(colors: [
              const Color(0xaa26344b).withOpacity(1),
              const Color(0xaa246af3).withOpacity(1),
            ], begin: AlignmentDirectional.topCenter, end: AlignmentDirectional.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/dev_images/code.png',
                height: 15.h,
              ),
              Text(
                'Welcome to Development Center',
                style: context.labelLarge
                    ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Boost digital business presence.',
                  style: context.labelLarge
                      ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Design, pace, implement, and affirm your digital print.',
                  style: context.labelLarge
                      ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'All the tools and technologies needed to create your digital entity. Reach out to your clients through our comprehensive web development kit plans.',
                  textAlign: TextAlign.center,
                  style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15.px),
                      backgroundColor: const Color(0xaaf5f5f5).withOpacity(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.px),
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
                  SizedBox(
                    width: 1.w,
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
                          borderRadius: BorderRadius.circular(5.px),
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
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'Showcases',
                          style: context.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 15.h,
                child: const DevCustomersCarousel(),
              ),
            ],
          ),
        ),
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
        SizedBox(
          height: 40.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      color: const Color(0xaaf3f3f3).withOpacity(1),
                      borderRadius: BorderRadius.circular(10.px),
                      border: const BorderDirectional(
                        start: BorderSide(color: Colors.white30),
                        end: BorderSide(color: Colors.white30),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(5, -5), blurRadius: 5),
                      ],
                    ),
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
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: const Color(0xaa2af598).withOpacity(1),
                          ),
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 40.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: const Color(0xaa2af598).withOpacity(1),
                          ),
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      color: const Color(0xaaf3f3f3).withOpacity(1),
                      borderRadius: BorderRadius.circular(10.px),
                      border: const BorderDirectional(
                        start: BorderSide(color: Colors.white30),
                        end: BorderSide(color: Colors.white30),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(-5, 10), blurRadius: 5),
                      ],
                    ),
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
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 40.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      color: const Color(0xaaf3f3f3).withOpacity(1),
                      borderRadius: BorderRadius.circular(10.px),
                      border: const BorderDirectional(
                        start: BorderSide(color: Colors.white30),
                        end: BorderSide(color: Colors.white30),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(5, -5), blurRadius: 5),
                      ],
                    ),
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
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: const Color(0xaa2af598).withOpacity(1),
                          ),
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
        SizedBox(
          height: 15.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.px),
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.px),
              bottomRight: Radius.circular(20.px),
            ),
            gradient: LinearGradient(colors: [
              const Color(0xaa26344b).withOpacity(1),
              const Color(0xaa246af3).withOpacity(1),
            ], begin: AlignmentDirectional.topCenter, end: AlignmentDirectional.bottomCenter),
            boxShadow: const [
              BoxShadow(offset: Offset(0, 0), blurRadius: 3, color: Colors.black38),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(
                'Success Metrics',
                style: context.labelLarge?.copyWith(color: Colors.white, fontSize: 18.sp),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.hotel_class_rounded,
                  color: const Color(0xaaffc947).withOpacity(1),
                ),
                Icon(
                  Icons.hotel_class_rounded,
                  color: const Color(0xaaffc947).withOpacity(1),
                ),
                Icon(
                  Icons.hotel_class_rounded,
                  color: const Color(0xaaffc947).withOpacity(1),
                ),
                Icon(
                  Icons.hotel_class_rounded,
                  color: const Color(0xaaffc947).withOpacity(1),
                ),
                Icon(
                  Icons.hotel_class_rounded,
                  color: const Color(0xaaffc947).withOpacity(1),
                )
              ]),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 13.w,
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.px), bottomRight: Radius.circular(10.px)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '23',
                          style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Icon(
                          Icons.phone_iphone_rounded,
                          color: Colors.white,
                          size: 60.px,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Mobile Applications',
                          style: context.labelLarge?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 13.w,
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.circular(10.px),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '11',
                          style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Icon(
                          Icons.web,
                          color: Colors.white,
                          size: 60.px,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Custom Websites',
                          style: context.labelLarge?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 13.w,
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.circular(10.px),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '12',
                          style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Icon(
                          Icons.move_up_rounded,
                          color: Colors.white,
                          size: 60.px,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Hosting Projects',
                          style: context.labelLarge?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 13.w,
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.px), bottomLeft: Radius.circular(10.px)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white30,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '6',
                          style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Icon(
                          Icons.phone_iphone_rounded,
                          color: Colors.white,
                          size: 60.px,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Integrated Solutions',
                          style: context.labelLarge?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
        SizedBox(
          height: 40.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xaaf0f0f0).withOpacity(1),
                      borderRadius: BorderRadius.circular(10.px),
                      border: const BorderDirectional(
                        start: BorderSide(color: Colors.white30),
                        end: BorderSide(color: Colors.white30),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(5, -5), blurRadius: 5),
                      ],
                    ),
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
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: const Color(0xaa2af598).withOpacity(1),
                          ),
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 40.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: const Color(0xaa2af598).withOpacity(1),
                          ),
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      color: const Color(0xaaf3f3f3).withOpacity(1),
                      borderRadius: BorderRadius.circular(10.px),
                      border: const BorderDirectional(
                        start: BorderSide(color: Colors.white30),
                        end: BorderSide(color: Colors.white30),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(-5, 10), blurRadius: 5),
                      ],
                    ),
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
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 40.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                      color: const Color(0xaaf3f3f3).withOpacity(1),
                      borderRadius: BorderRadius.circular(10.px),
                      border: const BorderDirectional(
                        start: BorderSide(color: Colors.white30),
                        end: BorderSide(color: Colors.white30),
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, offset: Offset(5, -5), blurRadius: 5),
                      ],
                    ),
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
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: const Color(0xaa2af598).withOpacity(1),
                          ),
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
                          SizedBox(
                            width: 1.w,
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
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
