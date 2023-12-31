import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class DevRightFeatureBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String first;
  final String second;
  final String third;
  final String fourth;
  final String thumb;
  const DevRightFeatureBlock(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.first,
      required this.second,
      required this.third,
      required this.fourth,
      required this.thumb});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        height: 40.h,
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
                    title,
                    style: context.labelLarge?.copyWith(
                        color: const Color(0xaa5a5f63).withOpacity(1), fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subtitle,
                    style: context.labelLarge?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xaa26344b).withOpacity(1),
                    ),
                  ),
                  Text(
                    description,
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
                        first,
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
                        second,
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
                        third,
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
                        fourth,
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
                  thumb,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
