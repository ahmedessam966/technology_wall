import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/en/hardware/printers/controllers/printers_controllers.dart';
import '../../../../global/controllers/metadata_controllers.dart';
import 'mobile_printer_card.dart';

class MobilePrintersBuilder extends StatelessWidget {
  const MobilePrintersBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrintersControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getPrinters(),
          builder: (context, snapshot) {
            MetadataControllers metadataControllers = MetadataControllers();
            metadataControllers.injectAllProducts('en', provider.printersList);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            }
            if (provider.printerSearchController.text.isEmpty) {
              return Semantics(
                label: 'Printers, All-In-One Printers, All-In-One',
                value:
                    'HP, Canon, Zebra, Epson, Dot Matrix, Epson Dot Maxtrix, Epson Printers, HP Laserjet, HP Deskjet, HP Printer, HP All-In-One, Canon All-In-One, Canon Printer, Canon Laserjet, Canon Copier',
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2.h,
                        ),
                    physics: const RangeMaintainingScrollPhysics(),
                    itemCount: provider.printersList.length,
                    itemBuilder: (context, index) {
                      final printer = provider.printersList[index];
                      return MobilePrinterCard(printer: printer);
                    }),
              );
            } else {
              return FutureBuilder(
                  future: provider.searchPrinters(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitCircle(
                          color: AppTheme.darkest,
                        ),
                      );
                    } else {
                      return ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 2.h,
                              ),
                          physics: const RangeMaintainingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final printer = snapshot.data?[index];
                            return MobilePrinterCard(printer: printer!);
                          });
                    }
                  });
            }
          });
    });
  }
}
