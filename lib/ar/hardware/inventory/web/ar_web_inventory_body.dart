import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../components/ar_inventory_category_card.dart';

class ARWebInventoryBody extends StatelessWidget {
  const ARWebInventoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return Semantics(
        container: true,
        label: 'Technology Wall | Hardware',
        value:
            'HP, Dell, Lenovo, MacBook, Apple, Acer, Asus, Toshiba, HP Notebooks, HP Laptops, Dell Notebooks, Dell Laptops, Lenovo Laptops, Lenovo Notebooks, MacBook Pro, MacBook Notebooks, MacBook Laptops, MacBook Pro Laptops, MacBook Pro Notebooks, Apple Laptops, Apple Notebooks, Acer Laptops, Acer Notebooks, Asus Laptops, Asus Notebooks, Toshiba Laptops, Toshiba Notebooks, Scanners, Fujitsu, Routers, Cisco, Cisco Routers, TP-Link, Switches, UPS, Servers, HP Servers, Dell Servers, HP G Series, HP G10, Dell PowerEdge, HP Workstation, Dell, Workstation, Firewalls, Fortinet, Fortigate, Sophos, CCTV, Cameras, Surveillance, Hik-Vision, NVR, DVR',
        child: Column(
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
                          'One-Stop Shop for Any Portable Computer',
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
                  Semantics(
                    image: true,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdevices.png?alt=media&token=cae21d15-de1a-4e45-b1a1-bfe2f11fdfde',
                      height: 250,
                    ),
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
                height: 1100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        'All Categories',
                        style: context.displaySmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    provider.generalHardwareSearchController.text.isEmpty
                        ? Expanded(
                            child: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1),
                              children: [
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/cabinets');
                                    },
                                    category: 'Cabinets',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcabinets.png?alt=media&token=92e2bd59-84f1-48af-914d-670fbc4472b9'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/cctv');
                                    },
                                    category: 'CCTV Cameras',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcctv.png?alt=media&token=6989cc7b-733f-4878-a8ec-04addd78f4fd'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/desktops');
                                    },
                                    category: 'Desktop PC',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/firewalls');
                                    },
                                    category: 'Firewalls',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffirewalls.png?alt=media&token=12d3254a-7573-40e9-a099-279febdce64b'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/notebooks');
                                    },
                                    category: 'Notebooks',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/printers');
                                    },
                                    category: 'Printers',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/routers');
                                    },
                                    category: 'Routers',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Frouters.png?alt=media&token=dd24a2ef-c660-4c4c-8411-488192730f6f'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/scanners');
                                    },
                                    category: 'Scanners',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fscanners.png?alt=media&token=f0e1fea2-659d-4f90-9758-4bdcec5af154'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/servers');
                                    },
                                    category: 'Servers',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/switches');
                                    },
                                    category: 'Switches',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fswitches.png?alt=media&token=ca014e2f-3f2f-469c-a85d-0b2e14a230b5'),
                                ARInventoryCategoryCard(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hardware/ups');
                                    },
                                    category: 'UPS',
                                    imagePath:
                                        'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fups.png?alt=media&token=a4f8e391-da19-4b0f-aaa3-32f69f4c27e3'),
                              ],
                            ),
                          )
                        : Expanded(
                            child: FutureBuilder(
                              future: provider.searchInventory(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                    child: SpinKitCircle(
                                      color: AppTheme.darkest,
                                    ),
                                  );
                                } else {
                                  return GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data?.length,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 0.7),
                                      itemBuilder: (context, index) {
                                        final product = snapshot.data?[index];
                                        return ARInventoryCategoryCard(
                                            category: product!.title, imagePath: product.snapshot);
                                      });
                                }
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
