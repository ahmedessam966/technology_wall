import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class SAPProductDetails extends StatelessWidget {
  final String product;
  final String image;
  const SAPProductDetails({super.key, required this.product, required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
      surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
      shape: const LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exploring $product Solution',
                  style: context.headlineSmall,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }
}
