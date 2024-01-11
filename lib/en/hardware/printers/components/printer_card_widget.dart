import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/models/product_model.dart';
import '../../../../config/themes/app_theme.dart';
import '../../../../global/controllers/app_controllers.dart';
import '../../../../global/controllers/cart_controllers.dart';
import '../../../shared/web/base_rect_button.dart';
import '../../../shared/web/web_printer_order_form.dart';

class PrinterCardWidget extends StatelessWidget {
  final ProductModel printer;
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
            flex: 8,
            child: Center(
              child: Image.network(
                printer.snapshot,
                width: 20.w,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Center(
              child: SelectableText(
                printer.title,
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
                  '• Printing Capability: ${printer.ppm} papers/minute',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• Printer Family: ${printer.family}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• Printer Type: ${printer.type}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• Network Module: ${printer.network}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• Ideal Utility: ${printer.utility}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 4,
                  child: BaseRectButton(
                    child: Text('Order Now',
                        style: context.bodyLarge?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                    action: () async {
                      await showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return WebPrinterOrderForm(
                              printer: printer,
                            );
                          });
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: Builder(builder: (context) {
                    final cart = Provider.of<CartControllers>(context, listen: true);
                    return BaseRectButton(
                      action: () {
                        cart.dbCart.containsKey(printer.id)
                            ? cart.removeFromCart(printer.id)
                            : cart.addToCart(printer);
                      },
                      child: cart.dbCart.containsKey(printer.id)
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
                ),
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
                Provider.of<AppControllers>(context, listen: false).changePage('Printers | ${printer.title}');
              },
              child: Text(
                'Printer Details',
                style: context.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
