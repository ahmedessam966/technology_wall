import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/hardware/printers/components/printers_builder_widget.dart';
import 'package:technology_wall/hardware/printers/components/refined_printers_builder_widget.dart';

class WebHardwareBody extends StatelessWidget {
  const WebHardwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
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
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
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
                            style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchBar(
                        hintText: 'Search by brand, model, or utility...',
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
                          hint: const Text('Filter by Brand'),
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
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: provider.printerFilterSelection == null || provider.printerFilterSelection == 'All'
                        ? const PrintersBuilderWidget()
                        : const RefinedPrintersBuilderWidget(),
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
