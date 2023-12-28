import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/models/printer_model.dart';
import '../../../../../config/themes/app_theme.dart';
import '../../../../../core/controllers/app_controllers.dart';
import '../../../../../core/controllers/cart_controllers.dart';
import '../../../shared/web/web_printer_order_form.dart';

class PrinterCardWidget extends StatelessWidget {
  final PrinterModel? printer;
  const PrinterCardWidget({super.key, required this.printer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.px),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.px),
        border: Border.all(color: Colors.black87),
        color: Colors.white38,
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: Image.network(
                printer!.snapshot,
                width: 15.w,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 4,
            child: Center(
              child: SelectableText(
                printer!.title,
                style: context.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  '• Printing Capability: ${printer?.ppm} papers/minute',
                  textAlign: TextAlign.justify,
                  style: context.bodyMedium,
                ),
                SelectableText(
                  '• Printer Family: ${printer?.family}',
                  textAlign: TextAlign.justify,
                  style: context.bodyMedium,
                ),
                SelectableText(
                  '• Printer Type: ${printer?.type}',
                  textAlign: TextAlign.justify,
                  style: context.bodyMedium,
                ),
                SelectableText(
                  '• Network Module: ${printer?.network}',
                  textAlign: TextAlign.justify,
                  style: context.bodyMedium,
                ),
                SelectableText(
                  '• Ideal Utility: ${printer?.utility}',
                  textAlign: TextAlign.justify,
                  style: context.bodyMedium,
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(10.px)),
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
                          return WebOrderForm(
                            item: printer,
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
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15.px)),
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
                      cart.cart.containsKey(printer?.id)
                          ? cart.removeFromCart(printer!.id)
                          : cart.addToCart(printer);
                    },
                    child: cart.cart.containsKey(printer?.id)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: 1.w,
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
          ),
          const Spacer(),
          Center(
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  LinearBorder.bottom(side: const BorderSide(color: AppTheme.darkest)),
                ),
              ),
              onPressed: () {
                Provider.of<AppControllers>(context, listen: false)
                    .changePage('Printers | ${printer?.brand} ${printer?.model}');
              },
              child: Text(
                'Printer Details',
                style: context.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
