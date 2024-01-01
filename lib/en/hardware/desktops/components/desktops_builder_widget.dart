import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/en/hardware/desktops/components/desktop_card_widget.dart';
import 'package:technology_wall/en/hardware/desktops/controllers/desktops_controllers.dart';

class DesktopsBuilderWidget extends StatelessWidget {
  const DesktopsBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DekstopsControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getDesktops(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              if (provider.desktopSearchController.text.isEmpty) {
                return GridView.builder(
                    physics: const RangeMaintainingScrollPhysics(),
                    itemCount: provider.desktopsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.w,
                        mainAxisSpacing: 2.w,
                        childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      final desktop = provider.desktopsList[index];
                      return DesktopCardWidget(desktop: desktop);
                    });
              } else {
                return FutureBuilder(
                    future: provider.searchDesktops(),
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
                              return DesktopCardWidget(desktop: desktop!);
                            });
                      }
                    });
              }
            }
          });
    });
  }
}
