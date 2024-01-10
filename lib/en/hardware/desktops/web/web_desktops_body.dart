import 'package:flutter/material.dart';
import '../../../shared/web/direct_dependencies_index.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/global/controllers/cart_controllers.dart';
import 'package:technology_wall/en/hardware/desktops/components/desktops_builder_widget.dart';
import 'package:technology_wall/en/hardware/desktops/controllers/desktops_controllers.dart';
import '../../../shared/web/cart_widget.dart';
import '../../../shared/web/web_purchase_order.dart';

class WebDesktopsBody extends StatelessWidget {
  const WebDesktopsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DekstopsControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const WebBlueHero(
              titleBig: 'One-Stop Shop for Any Desktop Computer',
              titleSmall: '',
              firstHead: 'For Personal Use',
              firstSub: 'Simple, trendy, and affordable collections',
              secondHead: 'For Business Use',
              secondSub: 'Flexible and customizable selections for a robust performance',
              actionPhrase:
                  'Explore the latest models from renowned manufacturers. Tailored for design, graphics, gaming, and development purposes',
              hasButton: false,
              image:
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fimac.webp?alt=media&token=b2f1e6e9-8666-4a5f-87d3-bc61dd946663'),
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
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdell.png?alt=media&token=0ca2a759-f048-4b31-bb88-ada49ba68690',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fhp.png?alt=media&token=93888802-9693-4f3f-a63f-50806af7c184',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fapple.png?alt=media&token=ba00b9c1-1470-4ea2-94f5-aae50216d565',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flenovo.png?alt=media&token=ff38cb73-0695-434b-aaee-7de5ea6943f8',
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
            child: SizedBox(
              height: provider.desktopsList.length <= 5 ? 260.h : 300.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Desktop Computers & Work Stations',
                      style: context.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Center(
                    child: Text(
                      'A selection of renowned brands and diverse utilities to serve your personal, entertainment, or business needs',
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
                        controller: provider.desktopSearchController,
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
                          provider.setDesktopSearchController(value);
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
                            'Select brand',
                            style: context.bodyLarge,
                          ),
                          value: provider.desktopFilterSelection,
                          borderRadius: BorderRadius.circular(5.px),
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
                              value: 'Dell',
                              child: Text('Dell'),
                            ),
                            DropdownMenuItem(
                              value: 'Lenovo',
                              child: Text('Lenovo'),
                            ),
                          ],
                          onChanged: (newValue) {
                            if (newValue != null && newValue != 'All') {
                              provider.setDesktopFilter(newValue);
                            }
                            if (newValue == 'All') {
                              provider.setDesktopFilter(null);
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
                    child: provider.desktopFilterSelection == null || provider.desktopFilterSelection == 'All'
                        ? const DesktopsBuilderWidget()
                        : const SizedBox(),
                  ),
                  SizedBox(
                    height: 5.h,
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
                              await provider.loadMoreItems();
                              provider.setLoading();
                            },
                      child: Text(
                        'Show More',
                        style: context.bodyLarge?.copyWith(color: AppTheme.darkest),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Couldn\'t find your product? Submit a requisition form and we will find it for you',
                      style: context.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Center(
                    child: BaseRectButton(
                      child: Text('Create Requisition',
                          style: context.bodyLarge?.copyWith(
                              color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                      action: () async {
                        await showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return const WebPurchaseOrder();
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
