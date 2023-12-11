import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';

class RefinedPrintersBuilderWidget extends StatelessWidget {
  const RefinedPrintersBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getBrandFilteredPrinters(provider.printerFilterSelection),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitThreeBounce(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    final printer = snapshot.data?[index];
                    return Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black87),
                        color: Colors.white,
                      ),
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Image.network(
                              printer.firstPath.toString(),
                              height: 100,
                              width: 200,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 4,
                            child: Text(
                              '${printer.brand} ${printer.model}',
                              style: context.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 5,
                            child: Text(
                              printer.specs,
                              textAlign: TextAlign.justify,
                              style: context.bodySmall,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 2,
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
                              onPressed: () {},
                              child: Text(
                                'Order Now',
                                style: context.bodyMedium?.copyWith(color: Colors.white70),
                              ),
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
