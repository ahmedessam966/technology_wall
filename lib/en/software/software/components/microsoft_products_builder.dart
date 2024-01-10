import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/shared/web/direct_dependencies_index.dart';
import 'package:technology_wall/en/software/software/controllers/microsoft_controllers.dart';
import '../../../../config/input_validation_services.dart';
import '../../../../global/controllers/cart_controllers.dart';
import '../../../../global/controllers/email_controller.dart';
import '../../../../global/controllers/inventory_controllers.dart';
import '../../../../global/models/product_model.dart';
part 'microsoft_card.g.dart';
part 'microsoft_order_form.g.dart';

class MicrosoftProductsBuilder extends StatelessWidget {
  const MicrosoftProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MicrosoftControllers>(builder: (context, provider, _) {
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
