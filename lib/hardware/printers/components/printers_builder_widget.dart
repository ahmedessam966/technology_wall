import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/routing_transition_services.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/core/widgets/web/web_printer_order_form.dart';
import 'printer_details_page.dart';

class PrintersBuilderWidget extends StatelessWidget {
  const PrintersBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getPrinters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  physics: const RangeMaintainingScrollPhysics(),
                  itemCount: provider.printersList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    if (index == provider.printersList.length - 1) {
                      // This is the last item, show a button to load more
                      return Center(
                        child: TextButton(
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.transparent;
                              } else {
                                return Colors.grey.shade100;
                              }
                            }),
                            shape: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return LinearBorder.bottom(side: const BorderSide(color: Colors.black));
                              } else {
                                return null;
                              }
                            }),
                          ),
                          onPressed: provider.isLoading
                              ? null
                              : () async {
                                  provider.setLoading();
                                  await provider.loadMoreItems();
                                  provider.setLoading();
                                },
                          child: Text(
                            'Show More',
                            style: context.bodyMedium?.copyWith(color: AppTheme.darkest),
                          ),
                        ),
                      );
                    }
                    final printer = provider.printersList[index];
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
                              child: Text(
                                '${printer.brand} ${printer.model}',
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
                                Text(
                                  '• Printing Capability: ${printer.ppm} papers/minute',
                                  textAlign: TextAlign.justify,
                                  style: context.bodySmall,
                                ),
                                Text(
                                  '• Printer Family: ${printer.family}',
                                  textAlign: TextAlign.justify,
                                  style: context.bodySmall,
                                ),
                                Text(
                                  '• Printer Type: ${printer.type}',
                                  textAlign: TextAlign.justify,
                                  style: context.bodySmall,
                                ),
                                Text(
                                  '• Network Module: ${printer.network}',
                                  textAlign: TextAlign.justify,
                                  style: context.bodySmall,
                                ),
                                Text(
                                  '• Ideal Utility: ${printer.utility}',
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
                                TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      LinearBorder.bottom(side: const BorderSide(color: AppTheme.darkest)),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<AppControllers>(context, listen: false)
                                        .changePage('Printers | ${printer.brand} ${printer.model}');
                                    Navigator.push(
                                        context,
                                        RoutingTransitionServices.Transition(
                                            PrinterDetailsPage(printer: printer)));
                                  },
                                  child: Text(
                                    'Printer Details',
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
                  });
            }
          });
    });
  }
}
