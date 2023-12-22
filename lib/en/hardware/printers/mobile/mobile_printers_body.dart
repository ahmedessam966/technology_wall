import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/en/hardware/printers/components/mobile_printers_builder.dart';

import '../../../../core/controllers/metadata_controllers.dart';

class MobilePrintersBody extends StatelessWidget {
  const MobilePrintersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focus = FocusNode();
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Explore or search for your desired printer. Explore the types of printers available: Color laserjet, dot-matrix, monochrome laserjet, deskjet, heavy-duty office utility, network printers, and all-in-one printer models. Guaranteed brands; HP, Canon, Epson, and Zebra printers.',
        'en');
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Hardware | Printers',
            style: context.headlineLarge
                ?.copyWith(color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'All printing purposes and supplies',
            style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            color: const Color(0xaaf7f7f7).withOpacity(1),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            width: double.infinity,
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  focusNode: focus,
                  controller: provider.printerSearchController,
                  elevation: MaterialStatePropertyAll(10.px),
                  backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
                  surfaceTintColor: MaterialStatePropertyAll(Colors.grey.shade200),
                  shadowColor: const MaterialStatePropertyAll(Colors.black87),
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px))),
                  hintText: 'Search here',
                  textStyle: MaterialStatePropertyAll(context.headlineMedium),
                  hintStyle: MaterialStatePropertyAll(context.headlineSmall),
                  leading: const Icon(Icons.search),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Expanded(child: MobilePrintersBuilder()),
              ],
            ),
          ),
        ],
      );
    });
  }
}
