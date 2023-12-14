import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../components/mobile_inventory_category_card.dart';

class MobileInventoryBody extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const MobileInventoryBody({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Inventory | Hardware',
          style: context.bodyLarge
              ?.copyWith(color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
        ),
        Text(
          'All necessary enterprise equipments, in one place',
          style: context.bodySmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: sh * 0.04,
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
          width: double.infinity,
          height: sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'All Categories',
                  style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: sh * 0.03,
              ),
              Expanded(
                child: GridView(
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: sw * 0.05,
                      mainAxisSpacing: sh * 0.02,
                      childAspectRatio: 1),
                  children: [
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/cabinets');
                        },
                        category: 'Cabinets',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcabinets.png?alt=media&token=92e2bd59-84f1-48af-914d-670fbc4472b9'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/cctv');
                        },
                        category: 'CCTV Cameras',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcctv.png?alt=media&token=6989cc7b-733f-4878-a8ec-04addd78f4fd'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/desktops');
                        },
                        category: 'Desktop PC',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/firewalls');
                        },
                        category: 'Firewalls',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffirewalls.png?alt=media&token=12d3254a-7573-40e9-a099-279febdce64b'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/notebooks');
                        },
                        category: 'Notebooks',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/printers');
                        },
                        category: 'Printers',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/routers');
                        },
                        category: 'Routers',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Frouters.png?alt=media&token=dd24a2ef-c660-4c4c-8411-488192730f6f'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/scanners');
                        },
                        category: 'Scanners',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fscanners.png?alt=media&token=f0e1fea2-659d-4f90-9758-4bdcec5af154'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/servers');
                        },
                        category: 'Servers',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/switches');
                        },
                        category: 'Switches',
                        imagePath:
                            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fswitches.png?alt=media&token=ca014e2f-3f2f-469c-a85d-0b2e14a230b5'),
                    MobileInventoryCategoryCard(
                        sh: sh,
                        sw: sw,
                        onPressed: () {
                          Navigator.pushNamed(context, '/hardware/ups');
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
