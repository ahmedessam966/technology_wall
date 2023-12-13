import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/models/notebook_model.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/widgets/web/web_notebook_form.dart';

class NotebookCardWidget extends StatelessWidget {
  final NotebookModel? notebook;
  const NotebookCardWidget({super.key, required this.notebook});

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
              child: Text(
                '${notebook?.brand} ${notebook?.model}',
                style: context.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                notebook!.model,
                style: context.bodyMedium,
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
                Text(
                  '• Processor: ${notebook?.processor}',
                  textAlign: TextAlign.justify,
                  style: context.bodySmall,
                ),
                Text(
                  '• Operating System: ${notebook?.os}',
                  textAlign: TextAlign.justify,
                  style: context.bodySmall,
                ),
                Text(
                  '• Graphics: ${notebook?.graphics}',
                  textAlign: TextAlign.justify,
                  style: context.bodySmall,
                ),
                Text(
                  '• Memory: ${notebook?.memory}',
                  textAlign: TextAlign.justify,
                  style: context.bodySmall,
                ),
                Text(
                  '• Storage: ${notebook?.storage}',
                  textAlign: TextAlign.justify,
                  style: context.bodySmall,
                ),
                Text(
                  '• Display: ${notebook?.display}',
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
                          return WebNotebookOrderForm(
                            item: notebook,
                          );
                        });
                  },
                  child: Text(
                    'Order Now',
                    style: context.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ),
                TextButton(
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
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
