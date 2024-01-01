import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/metadata_controllers.dart';
import 'package:technology_wall/global/models/product_model.dart';
import '../../../../global/controllers/cart_controllers.dart';
import '../../../shared/web/web_printer_order_form.dart';

class MobilePrinterCard extends StatelessWidget {
  final ProductModel printer;
  const MobilePrinterCard({super.key, required this.printer});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: printer.title,
      value:
          '${printer.brand}, ${printer.model}, ${printer.family}, ${printer.brand} Printer, ${printer.model} Printer',
      child: ExpansionTile(
        onExpansionChanged: (value) {
          MetadataControllers metadataControllers = MetadataControllers();
          if (value) {
            metadataControllers.injectProductSpecs(
                '${printer.title}: ${printer.brand}, ${printer.model}, ${printer.family}, ${printer.brand} Printer, ${printer.model} Printer',
                'en');
          } else {
            metadataControllers.clearInjectedProduct();
          }
        },
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.px), side: const BorderSide(color: Colors.black87)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.px), side: const BorderSide(color: Colors.black87)),
        title: Text(
          printer.title,
          style: context.headlineMedium,
        ),
        children: [
          Center(
            child: Image.network(
              printer.snapshot,
              height: 150.px,
              width: 150.px,
            ),
          ),
          SelectableText(
            '• Printing Capability: ${printer.ppm} papers/minute',
            textAlign: TextAlign.justify,
            style: context.headlineSmall,
          ),
          SelectableText(
            '• Printer Family: ${printer.family}',
            textAlign: TextAlign.justify,
            style: context.headlineSmall,
          ),
          SelectableText(
            '• Printer Type: ${printer.type}',
            textAlign: TextAlign.justify,
            style: context.headlineSmall,
          ),
          SelectableText(
            '• Network Module: ${printer.network}',
            textAlign: TextAlign.justify,
            style: context.headlineSmall,
          ),
          SelectableText(
            '• Ideal Utility: ${printer.utility}',
            textAlign: TextAlign.justify,
            style: context.headlineSmall,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      side: const BorderSide(color: Colors.white70),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color(0xaa7c9cc1).withOpacity(1);
                    } else {
                      return const Color(0xaa071923).withOpacity(1);
                    }
                  }),
                ),
                onPressed: () async {
                  await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return WebPrinterOrderForm(
                          printer: printer,
                        );
                      });
                },
                child: Text(
                  'Order Now',
                  style: context.bodyLarge?.copyWith(color: Colors.white70),
                ),
              ),
              Builder(builder: (context) {
                final cart = Provider.of<CartControllers>(context, listen: true);
                return ElevatedButton(
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                        side: const BorderSide(color: Colors.white70),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return const Color(0xaa7c9cc1).withOpacity(1);
                      } else {
                        return const Color(0xaa071923).withOpacity(1);
                      }
                    }),
                  ),
                  onPressed: () {
                    cart.cart.containsKey(printer.id)
                        ? cart.removeFromCart(printer.id)
                        : cart.addToCart(printer);
                  },
                  child: cart.cart.containsKey(printer.id)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.white70,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Added',
                              style: context.bodyLarge?.copyWith(color: Colors.white70),
                            ),
                          ],
                        )
                      : Text(
                          'Add to Cart',
                          style: context.bodyLarge?.copyWith(color: Colors.white70),
                        ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
