import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../../core/models/product_model.dart';

class Printer extends StatelessWidget {
  final ProductModel product;
  const Printer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          product.title,
          style: context.headlineLarge?.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 2.h,
        ),
        SelectableText(
          '• Type: ${product.type}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Family: ${product.family}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Printing Capacity: ${product.ppm} paper(s) / minute',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Network Module: ${product.network}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Optimized For: ${product.utility} use',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Warranty: ${product.warranty}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        const Spacer(),
        Row(
          children: [
            SelectableText(
              'Orginal Price: ',
              style: context.headlineSmall?.copyWith(
                color: Colors.white,
              ),
            ),
            SelectableText(
              '${product.price} ',
              style: context.headlineSmall?.copyWith(
                  color: Colors.white, decoration: TextDecoration.lineThrough, decorationColor: Colors.white),
            ),
            SelectableText(
              'SAR',
              style: context.headlineSmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        SelectableText(
          'Discount Price: ONLY ${product.maxDiscounted} SAR (VAT Exclusive)',
          style: context.headlineSmall?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        SelectableText(
          '* Offer Valid Till: January 1, 2024',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
