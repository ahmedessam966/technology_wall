import '../../../shared/web/direct_dependencies_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/global/controllers/cart_controllers.dart';
import 'package:technology_wall/en/hardware/notebooks/controllers/notebooks_controllers.dart';
import '../../../shared/web/cart_widget.dart';
import '../../../shared/web/web_purchase_order.dart';
import '../components/notebooks_builder_widget.dart';
import '../components/refined_notebooks_builder_widget.dart';

class WebNotebooksBody extends StatelessWidget {
  const WebNotebooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotebooksControllers>(builder: (context, provider, _) {
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
                        'One-Stop Shop for Any Portable Computer',
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
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a',
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
              height: provider.notebooksList.length <= 5 ? 260.h : 300.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Notebooks and Portable Computers',
                      style: context.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Center(
                    child: Text(
                      'A selection of renowned brands and diverse utilites to serve your personal, entertainment, or business needs',
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
                        controller: provider.notebookSearchController,
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
                          provider.setNBSearchController(value);
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
                          value: provider.notebookFilterSelection,
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
                              provider.setNBFilter(newValue);
                            }
                            if (newValue == 'All') {
                              provider.setNBFilter(null);
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
                    child:
                        provider.notebookFilterSelection == null || provider.notebookFilterSelection == 'All'
                            ? const NotebooksBuilderWidget()
                            : const RefinedNotebooksBuilderWidget(),
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
          ),
        ],
      );
    });
  }
}
