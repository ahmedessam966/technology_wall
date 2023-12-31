import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/en/shared/web/web_desktop_order_form.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/inventory_controllers.dart';
import 'package:technology_wall/en/shared/web/web_printer_order_form.dart';
import 'package:technology_wall/global/models/product_model.dart';

class FeaturedCarousel extends StatelessWidget {
  const FeaturedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InventoryControllers>(context, listen: false);
    return FutureBuilder(
        future: provider.getFeaturedProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitCircle(
                color: AppTheme.darkest,
              ),
            );
          } else {
            return FlutterCarousel.builder(
              itemCount: snapshot.data?.length,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlay: true,
                  height: 70.h,
                  slideIndicator: CircularWaveSlideIndicator(
                      currentIndicatorColor: Colors.black, indicatorBackgroundColor: Colors.grey)),
              itemBuilder: (context, index, _) {
                final product = snapshot.data?[index];
                return GestureDetector(
                  onTap: () async {
                    await showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          switch (product.category) {
                            case 'Desktops':
                              return WebDesktopOrderForm(desktop: product);
                            default:
                              return WebPrinterOrderForm(printer: product);
                          }
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadiusDirectional.circular(5),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [AppTheme.darkest, AppTheme.second, AppTheme.third],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 0),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Builder(builder: (ctx) {
                            switch (product!.category) {
                              case 'Desktops':
                                return Desktop(product: product);
                              case 'Notebooks':
                                return Notebook(product: product);
                              default:
                                return Printer(product: product);
                            }
                          }),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: Image.network(
                            product!.snapshot,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}

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
        Row(
          children: [
            SelectableText(
              '• Type: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.type}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Family: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.family}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Printing Capacity: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.ppm} papers / minute',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Network Module: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.network}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Optimized For: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.utility} use',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Warranty: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.warranty}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
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
              '${product.price} SAR',
              style: context.headlineSmall?.copyWith(
                  color: Colors.white, decoration: TextDecoration.lineThrough, decorationColor: Colors.white),
            ),
          ],
        ),
        SelectableText(
          'Discount Price: ONLY ${product.maxDiscounted}*',
          style: context.headlineSmall?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        SelectableText(
          '* Offer Valid Till: January 1, 2024',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '* Discounted Prices VAT EXCLUSIVE',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}

class Notebook extends StatelessWidget {
  final ProductModel product;
  const Notebook({super.key, required this.product});

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
        Row(
          children: [
            SelectableText(
              '• Processor: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.processor}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Operating System: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.os}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Graphics: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.graphics}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Memory: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.memory}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Storage: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.storage}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Display: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.display}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Warranty: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.warranty}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
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
              '${product.price} SAR',
              style: context.headlineSmall?.copyWith(
                  color: Colors.white, decoration: TextDecoration.lineThrough, decorationColor: Colors.white),
            ),
          ],
        ),
        Text(
          'Discount Price: ONLY ${product.maxDiscounted}*',
          style: context.headlineSmall?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        SelectableText(
          '* Offer Valid Till: January 1, 2024',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '* Discounted Prices VAT EXCLUSIVE',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}

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
        Row(
          children: [
            SelectableText(
              '• Processor: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.processor}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Operating System: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.os}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Graphics: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.graphics}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Memory: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.memory}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Storage: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.storage}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• Warranty: ',
              style: context.bodyLarge?.copyWith(color: Colors.white),
            ),
            SelectableText(
              '${product.warranty}',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            ),
          ],
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
              '${product.price} SAR',
              style: context.headlineSmall?.copyWith(
                  color: Colors.white, decoration: TextDecoration.lineThrough, decorationColor: Colors.white),
            ),
          ],
        ),
        Text(
          'Discount Price: ONLY ${product.maxDiscounted}*',
          style: context.headlineSmall?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        SelectableText(
          '* Offer Valid Till: January 1, 2024',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
        SelectableText(
          '* Discounted Prices VAT EXCLUSIVE',
          style: context.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
