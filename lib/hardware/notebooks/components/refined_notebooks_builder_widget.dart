import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/hardware/notebooks/components/notebook_card_widget.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/controllers/inventory_controllers.dart';

class RefinedNotebooksBuilderWidget extends StatelessWidget {
  const RefinedNotebooksBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getBrandFilteredNotebooks(provider.printerFilterSelection),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitThreeBounce(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    final notebook = snapshot.data?[index];
                    return NotebookCardWidget(notebook: notebook);
                  });
            }
          });
    });
  }
}