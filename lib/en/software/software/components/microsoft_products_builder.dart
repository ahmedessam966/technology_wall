import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/global/controllers/software_controllers.dart';

import 'microsoft_card.dart';

class MicrosoftProductsBuilder extends StatelessWidget {
  const MicrosoftProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SoftwareControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getMicrosoft(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  physics: const RangeMaintainingScrollPhysics(),
                  itemCount: provider.microsoftList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 2.w, mainAxisSpacing: 2.w, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    final microsoft = provider.microsoftList[index];
                    return MicrosoftCard(microsoft: microsoft);
                  });
            }
          });
    });
  }
}
