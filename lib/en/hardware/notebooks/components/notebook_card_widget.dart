import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/cart_controllers.dart';
import 'package:technology_wall/core/models/notebook_model.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../shared/web/web_notebook_form.dart';

class NotebookCardWidget extends StatelessWidget {
  final NotebookModel? notebook;
  const NotebookCardWidget({super.key, required this.notebook});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${notebook?.title}',
      value:
          '${notebook?.title}, ${notebook?.brand}, ${notebook?.model}, ${notebook?.title} Laptop, ${notebook?.brand} Laptops, ${notebook?.title} Notebook, ${notebook?.brand} Notebooks',
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
                  notebook!.snapshot,
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
                  notebook!.title,
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
                    '• Processor: ${notebook?.processor}',
                    style: context.bodyMedium,
                  ),
                  SelectableText(
                    '• Operating System: ${notebook?.os}',
                    style: context.bodyMedium,
                  ),
                  SelectableText(
                    '• Graphics: ${notebook?.graphics}',
                    style: context.bodyMedium,
                  ),
                  SelectableText(
                    '• Memory: ${notebook?.memory}',
                    style: context.bodyMedium,
                  ),
                  SelectableText(
                    '• Storage: ${notebook?.storage}',
                    style: context.bodyMedium,
                  ),
                  SelectableText(
                    '• Display: ${notebook?.display}',
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
                            return WebNotebookOrderForm(
                              item: notebook,
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
                        cart.cart.containsKey(notebook?.id)
                            ? cart.removeFromCart(notebook!.id)
                            : cart.addToCart(notebook);
                      },
                      child: cart.cart.containsKey(notebook?.id)
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
                  style: context.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
