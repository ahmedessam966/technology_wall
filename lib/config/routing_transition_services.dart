// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:technology_wall/base/en/shared/dev_redirect.dart';
import 'package:technology_wall/facebook_redirect.dart';
import '../base/en/pages_index.dart';

class RoutingTransitionServices {
  static Route Transition(page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // const begin = Offset(0.0, 1.0);
        // const end = Offset.zero;
        const curve = Curves.fastOutSlowIn;

        // final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      },
    );
  }

  static Widget generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? 'not-found';
    if (settings.name!.startsWith('/en?fbclid=')) {
      return const FacebookRedirect();
    } else {
      switch (routeName) {
        case '/':
          return const HomePage();
        case '/about':
          return const AboutPage();
        case '/about/accreditation':
          return const AccreditationPage();
        case '/contact-us':
          return const ContactPage();
        case '/hardware/cabinets':
          return const CabinetsPage();
        case '/hardware/cctv':
          return const CCTVPage();
        case '/hardware/desktops':
          return const DesktopsPage();
        case '/hardware/firewalls':
          return const FirewallsPage();
        case '/hardware/notebooks':
          return const NotebooksPage();
        case '/hardware/printers':
          return const PrintersPage();
        case '/hardware/routers':
          return const RoutersPage();
        case '/hardware/scanners':
          return const ScannersPage();
        case '/hardware/servers':
          return const ServersPage();
        case '/hardware/switches':
          return const SwitchesPage();
        case '/hardware/ups':
          return const UPSPage();
        case '/hardware':
          return const InventoryPage();
        case '/portal':
          return const CustomerPortal();
        case '/software':
          return const SoftwarePage();
        case '/software/fortinet':
          return const FortinetSoftwarePage();
        case '/software/microsoft':
          return const MicrosoftSoftwarePage();
        case '/software/sap':
          return const SAPPage();
        case '/software/sage':
          return const SagePage();
        case '/software/tally':
          return const TallyPage();
        case '/software/zoho':
          return const ZohoPage();
        case '/privacy':
          return const PrivacyPolicyPage();
        case '/not-found':
          return const NotFoundPage();
        case '/dev/en':
          return const DevRedirect();
        default:
          return const NotFoundPage();
      }
    }
  }
}
