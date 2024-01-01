import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/metadata_controllers.dart';

class SAPProductDetails extends StatelessWidget {
  final String product;
  const SAPProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final MetadataControllers metadata = MetadataControllers();
    metadata.updateHElement(
        'SAP S/4HANA Cloud ERP Solution',
        'A term covering all SAP enterprise resource planning solutions which are delivered via a Cloud or SaaS (software as a service) model.',
        null);
    return Dialog(
      backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
      surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
      shape: const LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exploring $product Solution',
                  style: context.headlineSmall,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }
}
