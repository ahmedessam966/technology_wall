import 'package:flutter/material.dart';

import '../../../../../core/controllers/metadata_controllers.dart';

class MobileSoftwareBody extends StatelessWidget {
  const MobileSoftwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'Find your desired personal or enterprise level software here. All licensed and maintainable. Available software essentials include Microsof Office, Microsoft 365, Microsoft Windows 11, Microsoft Windows 10, SAP Business One ERP Solution, Tally ERP Solution, Sage ERP, Zoho ERP Solutions, Fortinet Security Software, and much more.',
        'en');
    return const Column();
  }
}
