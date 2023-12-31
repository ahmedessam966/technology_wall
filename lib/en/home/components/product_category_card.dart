import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../config/themes/app_theme.dart';

class ProductCategoryCard extends StatelessWidget {
  final String category;
  final String description;
  final String imagePath;
  final dynamic onPressed;
  const ProductCategoryCard(
      {super.key,
      required this.category,
      required this.description,
      required this.imagePath,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 3.h, horizontal: 1.w)),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          surfaceTintColor: const MaterialStatePropertyAll(AppTheme.darkest),
          overlayColor: MaterialStatePropertyAll(const Color(0xaaf7f7f7).withOpacity(1)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.px),
                side: BorderSide(color: const Color(0xaaaaaeb6).withOpacity(1))),
          ),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return 2;
            } else {
              return 0;
            }
          }),
        ),
        onPressed: onPressed,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Image.network(
                imagePath,
                height: 20.h,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress?.cumulativeBytesLoaded != loadingProgress?.expectedTotalBytes) {
                    return const SpinKitFadingCircle(
                      color: AppTheme.darkest,
                    );
                  } else {
                    return child;
                  }
                },
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: Text(category,
                  style: context.headlineMedium?.copyWith(color: AppTheme.darkest.withOpacity(1))),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: context.bodyLarge?.copyWith(color: AppTheme.darkest.withOpacity(1))),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
