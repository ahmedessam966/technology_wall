import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/en/hardware/printers/controllers/printers_controllers.dart';
import '../components/printer_card_widget.dart';

class PrintersBuilderWidget extends StatelessWidget {
  const PrintersBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrintersControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getPrinters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            }
            if (provider.printerSearchController.text.isEmpty) {
              return GridView.builder(
                  physics: const RangeMaintainingScrollPhysics(),
                  itemCount: provider.printersList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 2.w, mainAxisSpacing: 2.w, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    final printer = provider.printersList[index];
                    return PrinterCardWidget(printer: printer);
                  });
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
                      return GridView.builder(
                          physics: const RangeMaintainingScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 2.w,
                              mainAxisSpacing: 2.w,
                              childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            final printer = snapshot.data?[index];
                            return PrinterCardWidget(printer: printer!);
                          });
                    }
                  });
            }
          });
    });
  }
}
