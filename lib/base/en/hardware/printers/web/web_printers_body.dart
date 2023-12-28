import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../../../../../core/controllers/metadata_controllers.dart';
import '../../../shared/web/cart_widget.dart';
import '../../../shared/web/web_purchase_order.dart';
import '../components/printers_builder_widget.dart';
import '../components/refined_printers_builder_widget.dart';

import '../../../../../config/themes/app_theme.dart';
import '../../../../../core/controllers/cart_controllers.dart';

class WebPrintersBody extends StatelessWidget {
  const WebPrintersBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();

    metadataControllers.injectPageSpecificContent(
        'Explore or search for your desired printer. Explore the types of printers available: Color laserjet, dot-matrix, monochrome laserjet, deskjet, heavy-duty office utility, network printers, and all-in-one printer models. Guaranteed brands; HP, Canon, Epson, and Zebra printers.',
        'en');
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'One-Stop Shop for Any Printing Purpose',
                        style: context.headlineMedium?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'For Personal Use',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      Text(
                        'Supplying primary hardware and up to complex servers.',
                        style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'For Business Use',
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      Text(
                        'Licensed, supported software soultions required for business intelligence',
                        style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Save valuable time and effort. Explore our integrated solutions plan.',
                        style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f',
                  height: 35.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            indent: 3.w,
            endIndent: 3.w,
            color: Colors.white70,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 12.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcanon.png?alt=media&token=13879247-d407-4014-be47-02560b767f08',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fhp.png?alt=media&token=93888802-9693-4f3f-a63f-50806af7c184',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffujitsu.png?alt=media&token=43a14824-0814-41f1-9c2e-2ce084b22bdd',
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
            color: const Color(0xaaf7f7f7).withOpacity(1),
            height: provider.printerFilterSelection != null && provider.printerFilterSelection!.isNotEmpty
                ? 130.h
                : 180.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SelectableText(
                    'Printer & Scanners',
                    style: context.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Center(
                  child: Text(
                    'A variety of multi-purpose printers and scanners suitable for business and personal use',
                    style: context.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchBar(
                      controller: provider.printerSearchController,
                      trailing: [
                        Text(
                          'search by brand',
                          style: context.bodyMedium,
                        ),
                        Checkbox.adaptive(
                            value: provider.searchByBrand,
                            onChanged: (newValue) {
                              provider.searchType();
                            }),
                      ],
                      hintText: 'Search by brand or model',
                      onSubmitted: (value) {
                        provider.setPrinterSearchController(value);
                      },
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.px),
                        ),
                      ),
                    ),
                    DropdownButton(
                        underline: const SizedBox.shrink(),
                        hint: Text(
                          'Show by Brand',
                          style: context.bodyLarge,
                        ),
                        value: provider.printerFilterSelection,
                        borderRadius: BorderRadius.circular(10.px),
                        style: context.bodyLarge,
                        items: const [
                          DropdownMenuItem(
                            value: 'All',
                            child: Text('All'),
                          ),
                          DropdownMenuItem(
                            value: 'HP',
                            child: Text('HP'),
                          ),
                          DropdownMenuItem(
                            value: 'Canon',
                            child: Text('Canon'),
                          ),
                          DropdownMenuItem(
                            value: 'Fujitsu',
                            child: Text('Fujitsu'),
                          ),
                        ],
                        onChanged: (newValue) {
                          if (newValue != null && newValue != 'All') {
                            provider.setFilter(newValue);
                          }
                          if (newValue == 'All') {
                            provider.setFilter(null);
                          }
                        }),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15.px)),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            'View Cart (${Provider.of<CartControllers>(context, listen: true).cart.keys.length})',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: provider.printerFilterSelection == null || provider.printerFilterSelection == 'All'
                      ? const PrintersBuilderWidget()
                      : const RefinedPrintersBuilderWidget(),
                ),
                SizedBox(
                  height: 5.h,
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
                                  await provider.loadMoreItems(provider.getPrinters());
                                  provider.setLoading();
                                },
                          child: Text(
                            'Show More',
                            style: context.bodyLarge?.copyWith(color: AppTheme.darkest),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    'Couldn\'t find your product? Submit a requsition form and we will find it for you',
                    style: context.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15.px)),
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
