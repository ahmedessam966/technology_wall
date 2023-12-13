import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/models/printer_model.dart';

class WebPrinterDetailsBody extends StatelessWidget {
  final PrinterModel printer;
  const WebPrinterDetailsBody({super.key, required this.printer});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xaaf7f7f7).withOpacity(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: AppTheme.darkest,
            child: Center(
              child: Text(
                '${printer.brand} Printers / ${printer.family} / ${printer.brand} ${printer.model}',
                style: context.titleMedium,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: AppTheme.darkest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All the basics, now with easy-to-use features. Print, scan, and copy everyday documents, and get worry-free wireless. Simple setup with HP Smart app means you’re ready on any device.',
                            style: context.headlineSmall?.copyWith(color: Colors.white70),
                            overflow: TextOverflow.clip,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Print Speed: Up to ${printer.ppm}/minute',
                            style: context.bodyLarge?.copyWith(color: Colors.white54),
                            overflow: TextOverflow.clip,
                          ),
                          const Divider(
                            color: Colors.white30,
                          ),
                          Text(
                            'Printer Family: ${printer.family}',
                            style: context.bodyLarge?.copyWith(color: Colors.white54),
                            overflow: TextOverflow.clip,
                          ),
                          const Divider(
                            color: Colors.white30,
                          ),
                          Text(
                            'Printer Type: ${printer.type}',
                            style: context.bodyLarge?.copyWith(color: Colors.white54),
                            overflow: TextOverflow.clip,
                          ),
                          const Divider(
                            color: Colors.white30,
                          ),
                          Text(
                            'Ideal For: ${printer.utility} Use',
                            style: context.bodyLarge?.copyWith(color: Colors.white54),
                            overflow: TextOverflow.clip,
                          ),
                          const Divider(
                            color: Colors.white30,
                          ),
                          Text(
                            'Connectivity (Wi-Fi / LAN): ${printer.network}',
                            style: context.bodyLarge?.copyWith(color: Colors.white54),
                            overflow: TextOverflow.clip,
                          ),
                          const Divider(
                            color: Colors.white30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Image.network(
                    printer.snapshot,
                    filterQuality: FilterQuality.high,
                    height: 400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
