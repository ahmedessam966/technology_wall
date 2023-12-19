import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/models/printer_model.dart';

import '../../../config/routing_transition_services.dart';
import '../../../config/themes/app_theme.dart';
import '../../../core/controllers/app_controllers.dart';
import '../../../core/controllers/cart_controllers.dart';
import '../../../core/widgets/web/web_printer_order_form.dart';
import 'printer_details_page.dart';

class PrinterCardWidget extends StatelessWidget {
  final PrinterModel? printer;
  const PrinterCardWidget({super.key, required this.printer});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${printer?.title}',
      value:
          '${printer?.brand}, ${printer?.model}, ${printer?.family}, ${printer?.brand} Printer, ${printer?.model} Printer',
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
                  height: 150,
                  width: 200,
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
                    style: context.bodySmall,
                  ),
                  SelectableText(
                    '• Printer Family: ${printer?.family}',
                    textAlign: TextAlign.justify,
                    style: context.bodySmall,
                  ),
                  SelectableText(
                    '• Printer Type: ${printer?.type}',
                    textAlign: TextAlign.justify,
                    style: context.bodySmall,
                  ),
                  SelectableText(
                    '• Network Module: ${printer?.network}',
                    textAlign: TextAlign.justify,
                    style: context.bodySmall,
                  ),
                  SelectableText(
                    '• Ideal Utility: ${printer?.utility}',
                    textAlign: TextAlign.justify,
                    style: context.bodySmall,
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
                      style: context.bodyMedium?.copyWith(color: Colors.white70),
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
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Added',
                                  style: context.bodyMedium?.copyWith(color: Colors.white70),
                                ),
                              ],
                            )
                          : Text(
                              'Add to Cart',
                              style: context.bodyMedium?.copyWith(color: Colors.white70),
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
                  // Navigator.push(
                  //     context, RoutingTransitionServices.Transition(PrinterDetailsPage(printer: printer)));
                },
                child: Text(
                  'Printer Details',
                  style: context.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
