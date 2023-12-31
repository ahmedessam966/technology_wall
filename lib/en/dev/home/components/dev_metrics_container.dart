import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class DevMetricsContainer extends StatelessWidget {
  final String mobile;
  final String web;
  final String hosting;
  final String integrated;
  const DevMetricsContainer(
      {super.key, required this.mobile, required this.web, required this.hosting, required this.integrated});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.px),
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.px),
          bottomRight: Radius.circular(20.px),
        ),
        gradient: LinearGradient(colors: [
          AppTheme.darkest.withOpacity(1),
          AppTheme.second.withOpacity(1),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          ),
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
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(10.px), bottomRight: Radius.circular(10.px)),
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
                      mobile,
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
                      web,
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
                      hosting,
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
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(10.px), bottomRight: Radius.circular(10.px)),
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
                      integrated,
                      style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Icon(
                      Icons.all_inclusive_rounded,
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
          SizedBox(
            height: 5.h,
          ),
          SelectableText(
            'Customized each and every project',
            style: context.labelLarge?.copyWith(color: Colors.white, fontSize: 14.sp),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_rounded,
                    color: const Color(0xaa2af598).withOpacity(1),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  SelectableText(
                    'No duplicates',
                    style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 14.sp),
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
                  SelectableText(
                    'No templates',
                    style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 14.sp),
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
                  SelectableText(
                    'Nothing reused',
                    style: context.labelLarge?.copyWith(color: Colors.white70, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
