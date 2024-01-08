import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/en/software/sap/controllers/sap_page_controllers.dart';

import '../../../../../config/themes/app_theme.dart';

class SAPIntroCard extends StatelessWidget {
  final String description;
  const SAPIntroCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SAPPageControllers>(context, listen: true);
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(25.w, 35.h)),
          padding: MaterialStatePropertyAll(EdgeInsets.all(50.px)),
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
              borderRadius: BorderRadius.circular(5.px),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.white)),
      onPressed: () {},
      child: SelectableText(
        'Traditional business models often decentralize data management, with each business function storing its own operational data in a separate database. This makes it difficult for employees from different business functions to access each other’s information. Furthermore, duplication of data across multiple departments increases IT storage costs and the risk of data errors.',
        style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
