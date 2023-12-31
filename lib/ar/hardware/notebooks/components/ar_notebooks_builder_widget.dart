import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'ar_notebook_card_widget.dart';

class ARNotebooksBuilderWidget extends StatelessWidget {
  const ARNotebooksBuilderWidget({super.key});

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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      final notebook = provider.notebooksList[index];
                      return ARNotebookCardWidget(notebook: notebook);
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
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.7),
                            itemBuilder: (context, index) {
                              final notebook = snapshot.data?[index];
                              return ARNotebookCardWidget(notebook: notebook!);
                            });
                      }
                    });
              }
            }
          });
    });
  }
}
