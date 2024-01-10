import '../../../shared/web/direct_dependencies_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/global/controllers/inventory_controllers.dart';
import '../components/inventory_category_card.dart';

class WebInventoryBody extends StatelessWidget {
  const WebInventoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const WebBlueHero(
              titleBig: 'Hardware Hub - The Place to Go for All Your Device Needs',
              titleSmall: '',
              firstHead: 'Diversity',
              firstSub: 'Delivering fundamental equipment and complex server networks.',
              secondHead: 'Reliability',
              secondSub: 'Empowering your business with authentic and supported hardware solutions.',
              actionPhrase: 'All hardware services, for business and personal purposes, in Hardware Hub.',
              hasButton: false,
              image:
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdevices.png?alt=media&token=cae21d15-de1a-4e45-b1a1-bfe2f11fdfde'),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
            color: const Color(0xaaf7f7f7).withOpacity(1),
            child: SizedBox(
              height: 140.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      'All Categories',
                      style: context.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  provider.generalHardwareSearchController.text.isEmpty
                      ? Expanded(
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 1.w,
                                mainAxisSpacing: 1.w,
                                childAspectRatio: 1),
                            children: [
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/accessories');
                                  },
                                  category: 'Accessories',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Faccessores.png?alt=media&token=2d106645-7014-4414-ac99-f7ebf1d0277b'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/cabinets');
                                  },
                                  category: 'Cabinets',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcabinets.png?alt=media&token=92e2bd59-84f1-48af-914d-670fbc4472b9'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/cctv');
                                  },
                                  category: 'CCTV Cameras',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcctv.png?alt=media&token=6989cc7b-733f-4878-a8ec-04addd78f4fd'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/desktops');
                                  },
                                  category: 'Desktop PC',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fimac.webp?alt=media&token=b2f1e6e9-8666-4a5f-87d3-bc61dd946663'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/firewalls');
                                  },
                                  category: 'Firewalls',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffirewalls.png?alt=media&token=12d3254a-7573-40e9-a099-279febdce64b'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/notebooks');
                                  },
                                  category: 'Notebooks',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/printers');
                                  },
                                  category: 'Printers',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/routers');
                                  },
                                  category: 'Routers',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Frouters.png?alt=media&token=dd24a2ef-c660-4c4c-8411-488192730f6f'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/scanners');
                                  },
                                  category: 'Scanners',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fscanners.png?alt=media&token=f0e1fea2-659d-4f90-9758-4bdcec5af154'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/servers');
                                  },
                                  category: 'Servers',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/switches');
                                  },
                                  category: 'Switches',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fswitches.png?alt=media&token=ca014e2f-3f2f-469c-a85d-0b2e14a230b5'),
                              InventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/hardware/ups');
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
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 2.w,
                                        mainAxisSpacing: 2.w,
                                        childAspectRatio: 0.7),
                                    itemBuilder: (context, index) {
                                      final product = snapshot.data?[index];
                                      return InventoryCategoryCard(
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
      );
    });
  }
}
