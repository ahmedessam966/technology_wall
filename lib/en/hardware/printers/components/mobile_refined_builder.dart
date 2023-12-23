import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../components/printer_card_widget.dart';

class MobileRefinedPrintersBuilder extends StatelessWidget {
  const MobileRefinedPrintersBuilder({super.key});

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
              return Semantics(
                label: 'Printers, All-In-One Printers, All-In-One',
                value:
                    'HP, Canon, Zebra, Epson, Dot Matrix, Epson Dot Maxtrix, Epson Printers, HP Laserjet, HP Deskjet, HP Printer, HP All-In-One, Canon All-In-One, Canon Printer, Canon Laserjet, Canon Copier',
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2.h,
                        ),
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final printer = snapshot.data?[index];
                      return PrinterCardWidget(printer: printer);
                    }),
              );
            }
          });
    });
  }
}
