import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class WebAccreditationBody extends StatelessWidget {
  const WebAccreditationBody({super.key});

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
                Center(
                  child: Text(
                    'Meet',
                    style: context.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 24.sp),
                  ),
                ),
                Center(
                  child: Text(
                    'Technology Wall',
                    style: context.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 22.sp),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
                    height: 9.h,
                  ),
                  Image.asset(
                    'assets/images/hcc.png',
                    height: 9.h,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                    height: 11.h,
                  ),
                ],
              ),
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
                          'Enriching the market with strong partnerships',
                          overflow: TextOverflow.clip,
                          style:
                              context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 2.h,
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
                      height: 45.h,
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
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          'Microsoft Fundamentals & Business Supplier',
                          overflow: TextOverflow.clip,
                          style:
                              context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'At Technology Wall, we are aware that keeping up the pace with the always-evolving software technologies. Technology Wall is aware of the necessity of Microsoft products for individual everyday utility as well as the accessibilty they offer to businesses. Technology Wall supplies all Microsoft products, licensed and authentic, for indiviuals and enterprises.',
                          style: context.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'assets/images/software.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
