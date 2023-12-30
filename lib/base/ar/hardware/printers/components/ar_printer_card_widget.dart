import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/models/product_model.dart';
import '../../../../../config/themes/app_theme.dart';
import '../../../../../core/controllers/app_controllers.dart';
import '../../../../../core/controllers/cart_controllers.dart';
import '../../../shared/web/ar_web_printer_order_form.dart';

class ARPrinterCardWidget extends StatelessWidget {
  final ProductModel printer;
  const ARPrinterCardWidget({super.key, required this.printer});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        label: printer.title,
        value:
            '${printer.brand}, ${printer.model}, ${printer.family}, ${printer.brand} Printer, ${printer.model} Printer',
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
                    printer.snapshot,
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
                      '• القدرة على الطباعة: ${printer.ppm} ورقة/دقيقة',
                      style: context.displayMedium,
                    ),
                    SelectableText(
                      '• عائلة الطابعة: ${printer.family}',
                      style: context.displayMedium,
                    ),
                    SelectableText(
                      '• نوع الطابعة: ${printer.type}',
                      style: context.displayMedium,
                    ),
                    SelectableText(
                      '• وحدة الشبكة: ${printer.network == 'N/A' ? 'لا يوجد' : '${printer.network}'}',
                      style: context.displayMedium,
                    ),
                    Builder(builder: (context) {
                      String ut = '';
                      printer.utility == 'Home'
                          ? ut = 'منزلي'
                          : printer.utility == 'Small Business/Home'
                              ? ut = 'أعمال صغيرة / منزلي'
                              : ut = 'مكتبي';
                      return SelectableText(
                        '• الأستخدام الأمثل: $ut',
                        style: context.displayMedium,
                      );
                    }),
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
                              return ARWebOrderForm(
                                item: printer,
                              );
                            });
                      },
                      child: Text(
                        'أطلب الأن',
                        style: context.displayMedium?.copyWith(color: Colors.white70),
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
                                    'مضافة',
                                    style: context.displayMedium?.copyWith(color: Colors.white70),
                                  ),
                                ],
                              )
                            : Text(
                                'أضف الى السلة',
                                style: context.displayMedium?.copyWith(color: Colors.white70),
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
                        .changePage('Printers | ${printer.brand} ${printer.model}');
                    // Navigator.push(
                    //     context, RoutingTransitionServices.Transition(PrinterDetailsPage(printer: printer)));
                  },
                  child: Text(
                    'تفاصيل كاملة',
                    style: context.displayMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
