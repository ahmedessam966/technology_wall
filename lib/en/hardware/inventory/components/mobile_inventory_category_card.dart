import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../../config/themes/app_theme.dart';

class MobileInventoryCategoryCard extends StatelessWidget {
  final String category;
  final String imagePath;
  final dynamic onPressed;
  const MobileInventoryCategoryCard({
    super.key,
    required this.category,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: MaterialStatePropertyAll(const Color(0xaaf7f7f7).withOpacity(1)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: const Color(0xaaaaaeb6).withOpacity(1))),
          ),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return 5;
            } else {
              return 0;
            }
          }),
        ),
        onPressed: onPressed,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Image.network(
                imagePath,
                height: 70.px,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Text(
                category,
                style: context.headlineMedium?.copyWith(color: AppTheme.darkest.withOpacity(1)),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
