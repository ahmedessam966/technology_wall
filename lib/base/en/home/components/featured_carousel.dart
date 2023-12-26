import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/base/en/shared/web/web_printer_order_form.dart';

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
                child: SpinKitCubeGrid(
              color: Color(0xaaf7f7f7),
            ));
          } else {
            return FlutterCarousel.builder(
              itemCount: snapshot.data?.length,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlay: true,
                  height: 500,
                  slideIndicator: CircularWaveSlideIndicator(
                      currentIndicatorColor: Colors.black, indicatorBackgroundColor: Colors.grey)),
              itemBuilder: (context, index, _) {
                final product = snapshot.data?[index];
                return GestureDetector(
                  onTap: () async {
                    await showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return WebOrderForm(
                            item: product,
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadiusDirectional.circular(5),
                      gradient: const RadialGradient(
                        radius: 1.5,
                        colors: [
                          Color(0xaa004e92),
                          Color(0xaa000428),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 0),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product!.title,
                                style: context.headlineLarge?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '• Type: ${product.type}',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              Text(
                                '• Family: ${product.family}',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              Text(
                                '• Printing Capacity: ${product.ppm} paper(s) / minute',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              Text(
                                '• Network Module: ${product.network}',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              Text(
                                '• Optimized For: ${product.utility} use',
                                style: context.bodyLarge?.copyWith(color: Colors.white70),
                              ),
                              Text(
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
                                        color: Colors.white,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.white),
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
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: Image.network(
                            product.snapshot,
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
