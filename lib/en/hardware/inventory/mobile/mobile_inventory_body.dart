import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../global/controllers/metadata_controllers.dart';
import '../components/mobile_inventory_category_card.dart';

class MobileInventoryBody extends StatelessWidget {
  const MobileInventoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Hardware Devices. Find and explore cctv cameras, server cabinets, firewalls, desktop computers, notebooks and laptops, printers, scanners, routers, switches, servers, and UPS devices.',
        'en');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Inventory | Hardware',
          style: context.headlineLarge
              ?.copyWith(color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          'All necessary enterprise equipments, in one place',
          style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 0.5.h),
          width: double.infinity,
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'All Categories',
                  style: context.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 2.h, mainAxisSpacing: 2.h, childAspectRatio: 1),
                  children: [
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/cabinets');
                        },
                        category: 'Cabinets',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcabinets.png?alt=media&token=92e2bd59-84f1-48af-914d-670fbc4472b9'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/cctv');
                        },
                        category: 'CCTV Cameras',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcctv.png?alt=media&token=6989cc7b-733f-4878-a8ec-04addd78f4fd'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/desktops');
                        },
                        category: 'Desktop PC',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/firewalls');
                        },
                        category: 'Firewalls',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffirewalls.png?alt=media&token=12d3254a-7573-40e9-a099-279febdce64b'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/notebooks');
                        },
                        category: 'Notebooks',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/printers');
                        },
                        category: 'Printers',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/routers');
                        },
                        category: 'Routers',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Frouters.png?alt=media&token=dd24a2ef-c660-4c4c-8411-488192730f6f'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/scanners');
                        },
                        category: 'Scanners',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fscanners.png?alt=media&token=f0e1fea2-659d-4f90-9758-4bdcec5af154'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/servers');
                        },
                        category: 'Servers',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/switches');
                        },
                        category: 'Switches',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fswitches.png?alt=media&token=ca014e2f-3f2f-469c-a85d-0b2e14a230b5'),
                    MobileInventoryCategoryCard(
                        onPressed: () {
                          Navigator.pushNamed(context, '/en/hardware/ups');
                        },
                        category: 'UPS',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fups.png?alt=media&token=a4f8e391-da19-4b0f-aaa3-32f69f4c27e3'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
