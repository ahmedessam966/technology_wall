import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/models/microsoft_model.dart';
import 'package:technology_wall/base/en/software/software/components/microsoft_order_form.dart';
import '../../../../../core/controllers/cart_controllers.dart';

class MicrosoftCard extends StatelessWidget {
  final MicrosoftModel? microsoft;
  const MicrosoftCard({super.key, required this.microsoft});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
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
                microsoft!.snapshot,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
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
            flex: microsoft?.officeFeatures == null ? 6 : 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  '• Edition: ${microsoft?.edition}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• License: ${microsoft?.license}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• Language Support: ${microsoft?.language}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• User Support: ${microsoft?.users}',
                  style: context.bodyLarge,
                ),
                Builder(builder: (ctx) {
                  if (microsoft?.officeFeatures == null) {
                    return const SizedBox.shrink();
                  } else {
                    return SelectableText(
                      '• Included Products: ${microsoft?.officeFeatures}',
                      textAlign: TextAlign.left,
                      style: context.bodyLarge,
                    );
                  }
                })
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 9,
                  child: ElevatedButton(
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
                            return MicrosoftOrderForm(
                              item: microsoft,
                            );
                          });
                    },
                    child: Text(
                      'Order Now',
                      textAlign: TextAlign.center,
                      style: context.bodyLarge?.copyWith(color: Colors.white70),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 9,
                  child: Builder(builder: (context) {
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
                              textAlign: TextAlign.center,
                              style: context.bodyLarge?.copyWith(color: Colors.white70),
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
