import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/en/software/sap/controllers/sap_page_controllers.dart';
import '../../../../config/themes/app_theme.dart';
import 'sap_product_details.dart';

class SAPProductCard extends StatelessWidget {
  final String image;
  final String title;
  const SAPProductCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SAPPageControllers>(context, listen: true);
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(20.px)),
          elevation: MaterialStatePropertyAll(provider.isHovered ? 4 : 1),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppTheme.second;
            } else if (states.contains(MaterialState.hovered)) {
              return AppTheme.darkest.withOpacity(0.1);
            } else {
              return null;
            }
          }),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
      onPressed: () async {
        await showAdaptiveDialog(
            context: context,
            builder: (context) {
              return SAPProductDetails(
                product: title,
              );
            });
      },
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: SvgPicture.asset(
              image,
              height: 11.h,
              width: 11.w,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.bodyLarge,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
