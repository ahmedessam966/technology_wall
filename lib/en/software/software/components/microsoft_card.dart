import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/metadata_controllers.dart';
import 'package:technology_wall/core/models/microsoft_model.dart';
import '../../../../core/controllers/cart_controllers.dart';
import '../../../shared/web/web_printer_order_form.dart';

class MicrosoftCard extends StatelessWidget {
  final MicrosoftModel? microsoft;
  const MicrosoftCard({super.key, required this.microsoft});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        '${microsoft?.title}, ${microsoft?.edition} software solutions for personal and enterprise utility.',
        'en');
    return Container(
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
            flex: 15,
            child: Center(
              child: Image.network(
                microsoft!.snapshot,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: Center(
              child: SelectableText(
                microsoft!.title,
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
                  '• Edition: ${microsoft?.edition}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• License: ${microsoft?.license}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• Language Support: ${microsoft?.language}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• User Support: ${microsoft?.users}',
                  textAlign: TextAlign.justify,
                  style: context.bodyLarge,
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
                      cart.cart.containsKey(microsoft?.id)
                          ? cart.removeFromCart(microsoft!.id)
                          : cart.addToCart(microsoft);
                    },
                    child: cart.cart.containsKey(microsoft?.id)
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
          ),
        ],
      ),
    );
  }
}
