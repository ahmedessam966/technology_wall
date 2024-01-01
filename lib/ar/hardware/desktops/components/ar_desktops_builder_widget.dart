import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/ar/hardware/desktops/controllers/ar_desktops_controllers.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'ar_desktops_card_widget.dart';

class ARDesktopsBuilderWidget extends StatelessWidget {
  const ARDesktopsBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ARDesktopsControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.arGetDesktops(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              if (provider.arDesktopSearchController.text.isEmpty) {
                return GridView.builder(
                    physics: const RangeMaintainingScrollPhysics(),
                    itemCount: provider.arDesktopsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.w,
                        mainAxisSpacing: 2.w,
                        childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      final desktop = provider.arDesktopsList[index];
                      return ARDesktopCardWidget(desktop: desktop);
                    });
              } else {
                return FutureBuilder(
                    future: provider.arSearchDesktops(),
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
                            itemCount: snapshot.data?.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2.w,
                                mainAxisSpacing: 2.w,
                                childAspectRatio: 0.7),
                            itemBuilder: (context, index) {
                              final desktop = snapshot.data?[index];
                              return ARDesktopCardWidget(desktop: desktop!);
                            });
                      }
                    });
              }
            }
          });
    });
  }
}
