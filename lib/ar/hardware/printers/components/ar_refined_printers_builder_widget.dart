import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import '../controllers/ar_printers_controllers.dart';
import 'ar_printer_card_widget.dart';

class RefinedPrintersBuilderWidget extends StatelessWidget {
  const RefinedPrintersBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ARPrintersControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.arGetBrandFilteredPrinters(provider.arPrinterFilterSelection),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return Semantics(
                label: 'Printers, All-In-One Printers, All-In-One',
                value:
                    'HP, Canon, Zebra, Epson, Dot Matrix, Epson Dot Maxtrix, Epson Printers, HP Laserjet, HP Deskjet, HP Printer, HP All-In-One, Canon All-In-One, Canon Printer, Canon Laserjet, Canon Copier',
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      final printer = snapshot.data?[index];
                      return ARPrinterCardWidget(printer: printer!);
                    }),
              );
            }
          });
    });
  }
}
