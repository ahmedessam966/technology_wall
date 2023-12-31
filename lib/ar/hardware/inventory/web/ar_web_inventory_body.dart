import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../components/ar_inventory_category_card.dart';

class ARWebInventoryBody extends StatelessWidget {
  const ARWebInventoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: SlideInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'مركز الأجهزة - المكان المناسب لتلبية جميع احتياجات الأجهزة الألكترونية',
                          style: context.titleMedium?.copyWith(
                              color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'التنوع',
                              style: context.displayLarge
                                  ?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            const Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Color(0xaaffffff),
                            ),
                          ],
                        ),
                        Text(
                          'توفير الأجهزة الأساسية وشبكات الخوادم المعقدة.',
                          style:
                              context.displayLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'اعتمادية',
                              style: context.displayLarge
                                  ?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            const Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Color(0xaaffffff),
                            ),
                          ],
                        ),
                        Text(
                          'تمكين أعمالك من خلال حلول الأجهزة الأصلية والمدعومة.',
                          style:
                              context.displayLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'كافة خدمات الأجهزة، لأغراض العمل والأغراض الشخصية، في مركز الأجهزة.',
                          style:
                              context.displayLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdevices.png?alt=media&token=cae21d15-de1a-4e45-b1a1-bfe2f11fdfde',
                    height: 45.h,
                  ),
                ),
              ],
            ),
          ),
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
                      'جميع الأقسام',
                      style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
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
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/cabinets');
                                  },
                                  category: 'الكبائن',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcabinets.png?alt=media&token=92e2bd59-84f1-48af-914d-670fbc4472b9'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/cctv');
                                  },
                                  category: 'كاميرات المراقبة',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcctv.png?alt=media&token=6989cc7b-733f-4878-a8ec-04addd78f4fd'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/desktops');
                                  },
                                  category: 'الحواسب المكتبية',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/firewalls');
                                  },
                                  category: 'جدار الحماية',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffirewalls.png?alt=media&token=12d3254a-7573-40e9-a099-279febdce64b'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/notebooks');
                                  },
                                  category: 'الحواسب المحمولة',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/printers');
                                  },
                                  category: 'الطابعات',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/routers');
                                  },
                                  category: 'أجهزة التوجيه',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Frouters.png?alt=media&token=dd24a2ef-c660-4c4c-8411-488192730f6f'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/scanners');
                                  },
                                  category: 'الماسحات الضوئية',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fscanners.png?alt=media&token=f0e1fea2-659d-4f90-9758-4bdcec5af154'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/servers');
                                  },
                                  category: 'الخوادم',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/switches');
                                  },
                                  category: 'المحولات',
                                  imagePath:
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fswitches.png?alt=media&token=ca014e2f-3f2f-469c-a85d-0b2e14a230b5'),
                              ARInventoryCategoryCard(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/hardware/ups');
                                  },
                                  category: 'أجهزة الطاقة المستمرة',
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
      );
    });
  }
}
