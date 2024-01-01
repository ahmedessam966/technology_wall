import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../components/printer_card_widget.dart';

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
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  physics: const RangeMaintainingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 2.w, mainAxisSpacing: 2.w, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    final printer = snapshot.data?[index];
                    return PrinterCardWidget(printer: printer!);
                  });
            }
          });
    });
  }
}
