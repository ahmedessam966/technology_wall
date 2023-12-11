import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../config/themes/app_theme.dart';

class HorizontalProductCategoryCard extends StatelessWidget {
  final String category;
  final String description;
  final String imagePath;
  final dynamic onPressed;
  const HorizontalProductCategoryCard(
      {super.key,
      required this.category,
      required this.description,
      required this.imagePath,
      this.onPressed});

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
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              imagePath,
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            height: 50,
            child: VerticalDivider(
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            width: 10,
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
                  style: context.headlineSmall?.copyWith(color: AppTheme.darkest.withOpacity(1)),
                ),
                Text(
                  description,
                  overflow: TextOverflow.clip,
                  style: context.bodyMedium?.copyWith(color: AppTheme.darkest.withOpacity(1)),
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
