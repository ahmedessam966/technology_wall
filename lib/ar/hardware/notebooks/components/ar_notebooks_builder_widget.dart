import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/ar/hardware/notebooks/controllers/ar_notebooks_controllers.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'ar_notebook_card_widget.dart';

class ARNotebooksBuilderWidget extends StatelessWidget {
  const ARNotebooksBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ARNotebooksControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.arGetNotebooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              if (provider.arNotebookSearchController.text.isEmpty) {
                return GridView.builder(
                    physics: const RangeMaintainingScrollPhysics(),
                    itemCount: provider.arNotebooksList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      final notebook = provider.arNotebooksList[index];
                      return ARNotebookCardWidget(notebook: notebook);
                    });
              } else {
                return FutureBuilder(
                    future: provider.arSearchNotebooks(),
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
