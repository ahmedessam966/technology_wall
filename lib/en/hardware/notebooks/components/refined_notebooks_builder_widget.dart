import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/en/hardware/notebooks/controllers/notebooks_controllers.dart';
import '../components/notebook_card_widget.dart';
import '../../../../config/themes/app_theme.dart';

class RefinedNotebooksBuilderWidget extends StatelessWidget {
  const RefinedNotebooksBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotebooksControllers>(builder: (context, provider, _) {
      return FutureBuilder(
          future: provider.getBrandFilteredNotebooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: AppTheme.darkest,
                ),
              );
            } else {
              return GridView.builder(
                  physics: const RangeMaintainingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 2.w, mainAxisSpacing: 2.w, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    final notebook = snapshot.data?[index];
                    return NotebookCardWidget(notebook: notebook!);
                  });
            }
          });
    });
  }
}
