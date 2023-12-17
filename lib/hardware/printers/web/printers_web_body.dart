import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/hardware/printers/components/printers_builder_widget.dart';
import 'package:technology_wall/hardware/printers/components/refined_printers_builder_widget.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/controllers/cart_controllers.dart';
import '../../../core/widgets/web/cart_widget.dart';
import '../../../core/widgets/web/web_purchase_order.dart';

class WebHardwareBody extends StatelessWidget {
  const WebHardwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Technology Wall | Printers',
      value:
          'HP Printers, Canon Printers, Epson Printers, Zebra Printers, Printers, Scanners, Copier, Scanner, HP All-In-One, Canon All-In-One, Epson Dot Matrix, Dot Matrix, HP Scanners, HP Copier, Epson Scanners, Network Printers, HP Network Printer',
      child: Consumer<InventoryControllers>(builder: (context, provider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 80),
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
                          style: context.displayMedium?.copyWith(
                              color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'For Personal Use',
                              style:
                                  context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Color(0xaaffffff),
                            ),
                          ],
                        ),
                        Text(
                          'Supplying primary hardware and up to complex servers.',
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'For Business Use',
                              style:
                                  context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Color(0xaaffffff),
                            ),
                          ],
                        ),
                        Text(
                          'Licensed, supported software soultions required for business intelligence',
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Save valuable time and effort. Explore our integrated solutions plan.',
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f',
                    height: 250,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Divider(
              indent: 50,
              endIndent: 50,
              color: Colors.white70,
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 100,
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
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              color: const Color(0xaaf7f7f7).withOpacity(1),
              child: SizedBox(
                height: 1000,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Printer & Scanners',
                        style: context.headlineMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'A variety of multi-purpose printers and scanners suitable for business and personal use',
                        style: context.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchBar(
                          controller: provider.printerSearchController,
                          trailing: [
                            const Text('search by brand'),
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
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        DropdownButton(
                            underline: const SizedBox.shrink(),
                            hint: const Text('Show by Brand'),
                            value: provider.printerFilterSelection,
                            borderRadius: BorderRadius.circular(10),
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
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'View Cart (${Provider.of<CartControllers>(context, listen: true).cart.keys.length})',
                                style: context.bodyMedium?.copyWith(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child:
                          provider.printerFilterSelection == null || provider.printerFilterSelection == 'All'
                              ? const PrintersBuilderWidget()
                              : const RefinedPrintersBuilderWidget(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
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
                          style: context.bodyMedium?.copyWith(color: AppTheme.darkest),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        'Couldn\'t find your product? Submit a requsition form and we will find it for you',
                        style: context.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                          style: context.bodyMedium?.copyWith(color: Colors.white70),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
