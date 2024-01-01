import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../global/models/product_model.dart';

class Desktop extends StatelessWidget {
  final ProductModel product;
  const Desktop({super.key, required this.product});

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
          '• Processor: ${product.processor}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Operating System: ${product.os}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Graphics: ${product.graphics}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Memory: ${product.memory}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Storage: ${product.storage}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '• Warranty: ${product.warranty}',
          style: context.bodyLarge?.copyWith(color: Colors.white70),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'Orginal Price: ',
              style: context.headlineSmall?.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              '${product.price} ',
              style: context.headlineSmall?.copyWith(
                  color: Colors.white, decoration: TextDecoration.lineThrough, decorationColor: Colors.white),
            ),
            Text(
              'SAR',
              style: context.headlineSmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          'Discount Price: ONLY ${product.maxDiscounted} SAR (VAT Exclusive)',
          style: context.headlineSmall?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        Text(
          '* Offer Valid Till: January 1, 2024',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
