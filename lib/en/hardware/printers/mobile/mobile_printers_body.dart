import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/en/hardware/printers/components/mobile_printers_builder.dart';
import 'package:technology_wall/en/hardware/printers/components/mobile_refined_builder.dart';
import 'package:technology_wall/en/hardware/printers/controllers/printers_controllers.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../global/controllers/cart_controllers.dart';
import '../../../../global/controllers/metadata_controllers.dart';
import '../../../shared/web/cart_widget.dart';
import '../../../shared/web/web_purchase_order.dart';

class MobilePrintersBody extends StatelessWidget {
  const MobilePrintersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focus = FocusNode();
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Explore or search for your desired printer. Explore the types of printers available: Color laserjet, dot-matrix, monochrome laserjet, deskjet, heavy-duty office utility, network printers, and all-in-one printer models. Guaranteed brands; HP, Canon, Epson, and Zebra printers.',
        'en');
    return Consumer<PrintersControllers>(builder: (context, provider, _) {
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
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            width: double.infinity,
            height: 80.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 7,
                      child: SearchBar(
                        focusNode: focus,
                        controller: provider.printerSearchController,
                        elevation: MaterialStatePropertyAll(10.px),
                        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
                        surfaceTintColor: MaterialStatePropertyAll(Colors.grey.shade200),
                        shadowColor: const MaterialStatePropertyAll(Colors.black87),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.px))),
                        hintText: 'Search here',
                        textStyle: MaterialStatePropertyAll(context.headlineMedium),
                        hintStyle: MaterialStatePropertyAll(context.headlineSmall),
                        leading: const Icon(Icons.search),
                        onSubmitted: (value) {
                          provider.setPrinterSearchController(value);
                        },
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 3,
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
                        onPressed: () async {
                          await showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return const CartWidget();
                              });
                        },
                        child: Text(
                          'Cart (${Provider.of<CartControllers>(context, listen: true).cart.keys.length})',
                          style: context.bodyLarge?.copyWith(color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 100.w,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Divider(
                          endIndent: 2.w,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Or',
                          style: context.headlineSmall,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Divider(
                          indent: 2.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                provider.printerFilterSelection == null || provider.printerFilterSelection == 'All'
                    ? Center(
                        child: Text(
                          'Explore All Printers',
                          style: context.headlineMedium,
                        ),
                      )
                    : Text(
                        'Search results for ${provider.printerFilterSelection}',
                        style: context.headlineMedium,
                      ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: provider.printerFilterSelection == null || provider.printerFilterSelection == 'All'
                      ? const MobilePrintersBuilder()
                      : const MobileRefinedPrintersBuilder(),
                ),
                provider.printerFilterSelection == null || provider.printerFilterSelection!.isEmpty
                    ? Center(
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
                            style: context.headlineMedium?.copyWith(color: AppTheme.darkest),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 2.h,
                ),
                const Divider(),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    width: 100.w,
                    child: Text(
                      'Couldn\'t find your product? Submit a requsition form and we will find it for you',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: context.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
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
                    onPressed: () async {
                      await showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return const WebPurchaseOrder();
                          });
                    },
                    child: Text(
                      'Create Requisition Request',
                      style: context.bodyLarge?.copyWith(color: Colors.white70),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
