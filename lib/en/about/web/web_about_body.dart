import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class WebAboutBody extends StatelessWidget {
  const WebAboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SlideInDown(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox(
            height: 45.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Center(
                    child: Text(
                      'Meet',
                      style: context.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 28.sp),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Technology Wall',
                    style: context.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 22.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Center(
                    child: Text(
                      'About Us',
                      style: context.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 22.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          'The beginning of Technology Wall - how it started.',
                          overflow: TextOverflow.clip,
                          style:
                              context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
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
                      height: 60.h,
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
                              child: CircleAvatar(
                                radius: 90.px,
                                backgroundImage: const AssetImage('assets/images/essam.png'),
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
                              child: CircleAvatar(
                                radius: 90.px,
                                backgroundImage: const AssetImage('assets/images/essam.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(10.px),
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black45),
                        borderRadius: const BorderRadius.all(Radius.zero),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/initiative.webp'), fit: BoxFit.cover),
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
                          'Technology Wall aims to be a major contributor in the digital initiative in Saudi Arabia.',
                          overflow: TextOverflow.clip,
                          style:
                              context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'In line with the vision of the Kingdom of Saudi Arabia for the year 2030, Technology Wall aims to contribute in the digital infrastructure development; keeping pace with developments in the field of technology is one of our paramount priorities. Technology Wall thrives to achieve customer satisfaction and providing comprehensive services stemming from our philosophy represented by placing the client in the first place.',
                          style: context.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  'As part of our vision, Technology Wall is committed to providing top-level service qualities regardless of the required task. Every client is just as valuable as the next. At Technology Wall, we relentlessy seek flexible accommodations to suffice each and every business requirement. We understand VALUE, which is why our operations are always audited with international quality standardizations that ultimately benefits our strategic partners, potential partners and prospects, and our clients.',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: context.bodyLarge,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                indent: 3.w,
                endIndent: 3.w,
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'Our Leadership',
                  style: context.headlineLarge,
                ),
              ),
              SizedBox(
                height: 5.h,
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
                        CircleAvatar(
                          radius: 100.px,
                          backgroundImage: const AssetImage('assets/images/essam.png'),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        Text(
                          'Essameldin Ahmed',
                          style: context.headlineMedium,
                        ),
                        SizedBox(
                          height: 1.h,
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
                        CircleAvatar(
                          radius: 100.px,
                          backgroundImage: const AssetImage('assets/images/essam.png'),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Muhib Marghilani',
                          style: context.headlineMedium,
                        ),
                        SizedBox(
                          height: 1.h,
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
