import 'package:flutter/material.dart';
import 'package:technology_wall/facebook_redirect.dart';
import '../pages_index.dart';

class RoutingMaps {
  static final Map<String, Widget Function(BuildContext)> routingMap = {
    '/en?fbclid=IwAR3L4OEQoLJ3BRpG3lGdKkLcH9QXfuDZIsRkbytn6hWCA4IkowUtA4CH47M': (context) =>
        const FacebookRedirect(),
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
    '/ar/about': (context) => const ARAboutPage(),
    '/ar/about/accreditation': (context) => const ARAccreditationPage(),
    '/ar/contact-us': (context) => const ARContactPage(),
    '/ar/hardware': (context) => const ARInventoryPage(),
    '/ar/hardware/cabinets': (context) => const ARCabinetsPage(),
    '/ar/hardware/cctv': (context) => const ARCCTVPage(),
    '/ar/hardware/desktops': (context) => const ARDesktopsPage(),
    '/ar/hardware/firewalls': (context) => const ARFirewallsPage(),
    '/ar/hardware/notebooks': (context) => const ARNotebooksPage(),
    '/ar/hardware/printers': (context) => const ARPrintersPage(),
    '/ar/hardware/routers': (context) => const ARRoutersPage(),
    '/ar/hardware/scanners': (context) => const ARScannersPage(),
    '/ar/hardware/servers': (context) => const ARServersPage(),
    '/ar/hardware/switches': (context) => const ARSwitchesPage(),
    '/ar/hardware/ups': (context) => const ARUPSPage(),
    '/ar/portal': (context) => const ARCustomerPortal(),
    '/ar/software': (context) => const ARSoftwarePage(),
    '/ar/software/fortinet': (context) => const ARFortinetSoftwarePage(),
    '/ar/software/microsoft': (context) => const ARMicrosoftSoftwarePage(),
    '/ar/software/sap': (context) => const ARSAPPage(),
    '/ar/software/sage': (context) => const ARSagePage(),
    '/ar/software/tally': (context) => const ARTallyPage(),
    '/ar/software/zoho': (context) => const ARZohoPage(),
    '/ar/privacy': (context) => const ARPrivacyPolicyPage(),
    '/ar/not-found': (context) => const ARNotFoundPage(),
  };
}
