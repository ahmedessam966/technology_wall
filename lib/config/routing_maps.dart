import 'package:flutter/material.dart';
import '../pages_index.dart';

class RoutingMaps {
  static final Map<String, Widget Function(BuildContext)> routingMap = {
    '/en': (context) => const HomePage(),
    '/en/about': (context) => const AboutPage(),
    '/en/about/accreditation': (context) => const AccreditationPage(),
    '/en/contact-us': (context) => const ContactPage(),
    '/en/hardware': (context) => const InventoryPage(),
    '/en/hardware/cabinets': (context) => const CabinetsPage(),
    '/en/hardware/cctv': (context) => const CCTVPage(),
    '/en/hardware/desktops': (context) => const DesktopsPage(),
    '/en/hardware/firewalls': (context) => const FirewallsPage(),
    '/en/hardware/notebooks': (context) => const NotebooksPage(),
    '/en/hardware/printers': (context) => const PrintersPage(),
    '/en/hardware/routers': (context) => const RoutersPage(),
    '/en/hardware/scanners': (context) => const ScannersPage(),
    '/en/hardware/servers': (context) => const ServersPage(),
    '/en/hardware/switches': (context) => const SwitchesPage(),
    '/en/hardware/ups': (context) => const UPSPage(),
    '/en/portal': (context) => const CustomerPortal(),
    '/en/software': (context) => const SoftwarePage(),
    '/en/software/fortinet': (context) => const FortinetSoftwarePage(),
    '/en/software/microsoft': (context) => const MicrosoftSoftwarePage(),
    '/en/software/sap': (context) => const SAPPage(),
    '/en/software/sage': (context) => const SagePage(),
    '/en/software/tally': (context) => const TallyPage(),
    '/en/software/zoho': (context) => const ZohoPage(),
    '/en/privacy': (context) => const PrivacyPolicyPage(),
    '/en/not-found': (context) => const NotFoundPage(),

    //////////////////////////////////////////////////////
    ///Arabic Routing Map
    //////////////////////////////////////////////////////

    '/ar': (context) => const ARHomePage(),
    '/ar/about': (context) => const AboutPage(),
    '/ar/about/accreditation': (context) => const AccreditationPage(),
    '/ar/contact-us': (context) => const ContactPage(),
    '/ar/hardware': (context) => const InventoryPage(),
    '/ar/hardware/cabinets': (context) => const CabinetsPage(),
    '/ar/hardware/cctv': (context) => const CCTVPage(),
    '/ar/hardware/desktops': (context) => const DesktopsPage(),
    '/ar/hardware/firewalls': (context) => const FirewallsPage(),
    '/ar/hardware/notebooks': (context) => const NotebooksPage(),
    '/ar/hardware/printers': (context) => const PrintersPage(),
    '/ar/hardware/routers': (context) => const RoutersPage(),
    '/ar/hardware/scanners': (context) => const ScannersPage(),
    '/ar/hardware/servers': (context) => const ServersPage(),
    '/ar/hardware/switches': (context) => const SwitchesPage(),
    '/ar/hardware/ups': (context) => const UPSPage(),
    '/ar/portal': (context) => const CustomerPortal(),
    '/ar/software': (context) => const SoftwarePage(),
    '/ar/software/fortinet': (context) => const FortinetSoftwarePage(),
    '/ar/software/microsoft': (context) => const MicrosoftSoftwarePage(),
    '/ar/software/sap': (context) => const SAPPage(),
    '/ar/software/sage': (context) => const SagePage(),
    '/ar/software/tally': (context) => const TallyPage(),
    '/ar/software/zoho': (context) => const ZohoPage(),
    '/ar/privacy': (context) => const PrivacyPolicyPage(),
    '/ar/not-found': (context) => const NotFoundPage(),
  };
}
