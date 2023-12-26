import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../../../core/controllers/metadata_controllers.dart';

class MobileNotebooksBody extends StatelessWidget {
  const MobileNotebooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Top-line notebooks and laptops provided by Technology Wall. World renowned brands that offer extreme and versatile performance. Offering a selection for each of the following brands: HP, Dell, Toshiba, Lenovo, Apple, Acer, and Asus. Technology Wall condones diversity when it comes to utility; assortments of devices that accommodate gaming, graphic design, and personal use.',
        'en');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Hardware | Notebooks',
          style: context.headlineLarge
              ?.copyWith(color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          'Performance, utility, and portability',
          style: context.headlineSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          width: double.infinity,
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                elevation: MaterialStatePropertyAll(10.px),
                backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
                surfaceTintColor: MaterialStatePropertyAll(Colors.grey.shade200),
                shadowColor: const MaterialStatePropertyAll(Colors.black87),
                shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px))),
                hintText: 'Search here',
                textStyle: MaterialStatePropertyAll(context.headlineMedium),
                hintStyle: MaterialStatePropertyAll(context.headlineSmall),
                leading: const Icon(Icons.search),
              ),
            ],
          ),
        )
      ],
    );
  }
}
