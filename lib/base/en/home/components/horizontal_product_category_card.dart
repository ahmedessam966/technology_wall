import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../../config/themes/app_theme.dart';

class HorizontalProductCategoryCard extends StatelessWidget {
  final String category;
  final String imagePath;
  final bool isMobile;
  final dynamic onPressed;
  const HorizontalProductCategoryCard(
      {super.key, required this.category, required this.imagePath, this.onPressed, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: MaterialStatePropertyAll(const Color(0xaaf7f7f7).withOpacity(1)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: const Color(0xaaaaaeb6).withOpacity(1))),
          ),
          elevation: const MaterialStatePropertyAll(2)),
      onPressed: onPressed,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: isMobile ? 4 : 1,
            child: Image.network(
              imagePath,
              height: 70.px,
              width: 70.px,
            ),
          ),
          SizedBox(
            width: 0.5.w,
          ),
          SizedBox(
            height: 60.px,
            child: const VerticalDivider(
              color: Colors.black87,
            ),
          ),
          SizedBox(
            width: 0.5.w,
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: isMobile
                      ? context.headlineMedium?.copyWith(color: AppTheme.darkest.withOpacity(1))
                      : context.headlineMedium?.copyWith(color: AppTheme.darkest.withOpacity(1)),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
