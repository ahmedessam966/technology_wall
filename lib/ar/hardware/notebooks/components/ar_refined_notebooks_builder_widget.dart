import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../controllers/ar_notebooks_controllers.dart';
import 'ar_notebook_card_widget.dart';
import '../../../../config/themes/app_theme.dart';

class ARRefinedNotebooksBuilderWidget extends StatelessWidget {
  const ARRefinedNotebooksBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ARNotebooksControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.arGetBrandFilteredNotebooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    final notebook = snapshot.data?[index];
                    return ARNotebookCardWidget(notebook: notebook!);
                  });
            }
          });
    });
  }
}
