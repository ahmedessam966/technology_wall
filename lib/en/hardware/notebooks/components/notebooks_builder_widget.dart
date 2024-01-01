import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import '../components/notebook_card_widget.dart';

class NotebooksBuilderWidget extends StatelessWidget {
  const NotebooksBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getNotebooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              if (provider.notebookSearchController.text.isEmpty) {
                return GridView.builder(
                    physics: const RangeMaintainingScrollPhysics(),
                    itemCount: provider.notebooksList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.w,
                        mainAxisSpacing: 2.w,
                        childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      final notebook = provider.notebooksList[index];
                      return NotebookCardWidget(notebook: notebook);
                    });
              } else {
                return FutureBuilder(
                    future: provider.searchNotebooks(),
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
                              final notebook = snapshot.data?[index];
                              return NotebookCardWidget(notebook: notebook!);
                            });
                      }
                    });
              }
            }
          });
    });
  }
}
