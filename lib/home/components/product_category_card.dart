import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../config/themes/app_theme.dart';

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
      height: 500,
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
                height: 200,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: Text(
                category,
                style: context.displaySmall?.copyWith(color: AppTheme.darkest.withOpacity(1)),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: context.bodyMedium?.copyWith(color: AppTheme.darkest.withOpacity(1)),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
