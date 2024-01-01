import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/cart_controllers.dart';
import 'package:technology_wall/global/models/product_model.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../shared/web/ar_web_notebook_form.dart';

class ARNotebookCardWidget extends StatelessWidget {
  final ProductModel notebook;
  const ARNotebookCardWidget({super.key, required this.notebook});

  @override
  Widget build(BuildContext context) {
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
            flex: 10,
            child: Center(
              child: Image.network(
                notebook.snapshot,
                height: 150,
                width: 200,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Center(
              child: SelectableText(
                notebook.title,
                style: context.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  '• Processor: ${notebook.processor}',
                  style: context.bodySmall,
                ),
                SelectableText(
                  '• Operating System: ${notebook.os}',
                  style: context.bodySmall,
                ),
                SelectableText(
                  '• Graphics: ${notebook.graphics}',
                  style: context.bodySmall,
                ),
                SelectableText(
                  '• Memory: ${notebook.memory}',
                  style: context.bodySmall,
                ),
                SelectableText(
                  '• Storage: ${notebook.storage}',
                  style: context.bodySmall,
                ),
                SelectableText(
                  '• Display: ${notebook.display}',
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
                          return ARWebNotebookOrderForm(
                            product: notebook,
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
                      cart.cart.containsKey(notebook.id)
                          ? cart.removeFromCart(notebook.id)
                          : cart.addToCart(notebook);
                    },
                    child: cart.cart.containsKey(notebook.id)
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
              onPressed: () {},
              child: Text(
                'Full Specifications',
                style: context.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
