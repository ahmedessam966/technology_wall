import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import 'dev_coustomer_carousel.dart';

class DevHeader extends StatelessWidget {
  const DevHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
